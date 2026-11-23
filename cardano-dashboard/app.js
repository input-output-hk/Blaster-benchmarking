const $ = (selector) => document.querySelector(selector);
const NS = "http://www.w3.org/2000/svg";
const repoBase = "https://github.com/input-output-hk/Blaster-benchmarking/blob/main/";
let data = { scripts: [], cohorts: [], events: [] };
let filters = { search: "", network: "", version: "", status: "", purpose: "" };
let shown = 120;
let metric = "percent";
let cohort = null;

function esc(value) {
  return String(value ?? "").replace(/[&<>"']/g, (ch) => ({
    "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;"
  })[ch]);
}
function shortHash(hash) { return `${hash.slice(0, 10)}…${hash.slice(-7)}`; }
function formatTime(seconds) {
  return seconds ? new Date(seconds * 1000).toLocaleString(undefined, {dateStyle: "medium", timeStyle: "short"}) : "Unknown";
}
function svg(tag, attrs = {}, text = "") {
  const node = document.createElementNS(NS, tag);
  Object.entries(attrs).forEach(([key, value]) => node.setAttribute(key, String(value)));
  if (text) node.textContent = text;
  return node;
}
function safeUrl(value) {
  try { const url = new URL(value); return ["https:", "http:"].includes(url.protocol) ? url.href : "#"; }
  catch { return "#"; }
}

function updateHeadline() {
  const families = new Map();
  data.scripts.forEach((s) => {
    if (s.cluster_id) families.set(s.cluster_id, (families.get(s.cluster_id) || 0) + 1);
  });
  $("#stat-scripts").textContent = data.scripts.length.toLocaleString();
  $("#stat-verified").textContent = data.scripts.filter((s) => s.status === "verified").length.toLocaleString();
  $("#stat-families").textContent = [...families.values()].filter((size) => size > 1).length.toLocaleString();
}

function setupCohorts() {
  const select = $("#cohort-select");
  select.innerHTML = "";
  const ordered = [...data.cohorts].sort((a, b) => String(b.created_at).localeCompare(String(a.created_at)));
  ordered.forEach((entry) => select.add(new Option(`${entry.name} · ${entry.script_hashes.length.toLocaleString()} scripts`, entry.name)));
  cohort = ordered[0] || null;
  if (!cohort) select.add(new Option("No frozen cohort", ""));
  select.addEventListener("change", () => { cohort = ordered.find((c) => c.name === select.value) || null; renderChart(); });
  document.querySelectorAll("[data-metric]").forEach((button) => button.addEventListener("click", () => {
    metric = button.dataset.metric;
    document.querySelectorAll("[data-metric]").forEach((b) => b.classList.toggle("active", b === button));
    renderChart();
  }));
}

function chartValue(run, denominator) {
  const count = Number(run.solved_count || 0);
  return metric === "percent" ? count * 100 / Math.max(1, denominator) : count;
}
function axisLabel(value) {
  return metric === "percent" ? `${value.toFixed(value < 1 ? 2 : 1)}%` : String(Math.round(value));
}
function inspectRun(run, index, total) {
  const panel = $("#run-inspector");
  const pr = run.pr_url ? `<a href="${esc(safeUrl(run.pr_url))}" target="_blank" rel="noopener noreferrer">PR #${esc(run.pr_number || "view")}</a>` : "No PR linked";
  panel.innerHTML = `<strong>Run #${index + 1} · ${esc(run.title || "Benchmark run")}</strong><br>${esc(run.author || "Contributor")} · ${esc(run.solved_count || 0)} of ${total} scripts solved · ${esc(run.gained || 0)} gained · ${esc(run.regressed || 0)} regressed · ${pr}<br><span>${esc(run.summary || "No run note provided.")}</span>`;
  panel.hidden = false;
}
function renderChart() {
  const chart = $("#frontier-chart"); chart.replaceChildren();
  const total = cohort?.script_hashes.length || 0;
  const runs = data.events.filter((event) => event.cohort === cohort?.name && event.verified_run !== false)
    .sort((a, b) => String(a.timestamp).localeCompare(String(b.timestamp)) || String(a.run_id).localeCompare(String(b.run_id)));
  const kept = []; let best = 0;
  runs.forEach((run) => { const score = Number(run.solved_count || 0); kept.push(score > best); best = Math.max(best, score); });
  $("#scope-note").textContent = cohort
    ? `Fixed benchmark scope: ${cohort.name} · ${total.toLocaleString()} unique scripts. The live corpus may grow, but this cohort's denominator stays fixed so PR gains remain comparable.`
    : "A fixed cohort is needed before benchmark runs can be compared.";
  $("#chart-total").textContent = `${runs.length.toLocaleString()} verified runs · ${kept.filter(Boolean).length} breakthroughs · best ${best.toLocaleString()} / ${total.toLocaleString()} (${(best * 100 / Math.max(1, total)).toFixed(2)}%)`;
  $("#chart-empty").hidden = runs.length > 0;
  const W = 1200, H = 500, L = 76, R = 35, T = 65, B = 67, iw = W - L - R, ih = H - T - B;
  const values = runs.map((run) => chartValue(run, total));
  const observed = Math.max(0, ...values);
  const ymax = metric === "percent" ? Math.max(.05, observed * 1.28) : Math.max(1, Math.ceil(observed * 1.28));
  const x = (i) => L + (runs.length <= 1 ? 0 : i * iw / (runs.length - 1));
  const y = (v) => T + ih - (v / ymax) * ih;
  for (let tick = 0; tick <= 4; tick++) {
    const value = ymax * tick / 4, py = y(value);
    chart.append(svg("line", {x1: L, x2: W - R, y1: py, y2: py, class: "chart-grid"}));
    chart.append(svg("text", {x: L - 10, y: py + 5, "text-anchor": "end", class: "chart-axis"}, axisLabel(value)));
  }
  chart.append(svg("line", {x1: L, x2: W - R, y1: y(0), y2: y(0), stroke: "#98aab9", "stroke-width": 1.5}));
  chart.append(svg("text", {x: W / 2, y: H - 15, "text-anchor": "middle", class: "chart-label"}, "Chronological verified run #"));
  if (!runs.length) {
    chart.append(svg("path", {d: `M ${L} ${y(0)} H ${W - R}`, class: "chart-line"}));
    return;
  }
  const marks = [...new Set([0, Math.floor((runs.length - 1) / 4), Math.floor((runs.length - 1) / 2), Math.floor(3 * (runs.length - 1) / 4), runs.length - 1])];
  marks.forEach((i) => chart.append(svg("text", {x: x(i), y: H - 41, "text-anchor": "middle", class: "chart-axis"}, `#${i + 1}`)));
  let previous = 0, path = `M ${L} ${y(0)}`;
  runs.forEach((run, i) => {
    const next = Math.max(previous, chartValue(run, total));
    path += ` H ${x(i)} V ${y(next)}`;
    previous = next;
  });
  path += ` H ${W - R}`;
  chart.append(svg("path", {d: path, class: "chart-line"}));
  runs.forEach((run, i) => {
    const circle = svg("circle", {cx: x(i), cy: y(values[i]), r: kept[i] ? 7 : 5, class: `chart-dot ${kept[i] ? "kept" : "discarded"}`, tabindex: 0, role: "button", "aria-label": `Run ${i + 1}, ${run.solved_count || 0} scripts solved`});
    circle.addEventListener("click", () => inspectRun(run, i, total));
    circle.addEventListener("mouseenter", () => inspectRun(run, i, total));
    circle.addEventListener("keydown", (event) => { if (event.key === "Enter" || event.key === " ") {event.preventDefault(); inspectRun(run, i, total);} });
    chart.append(circle);
  });
  runs.forEach((run, i) => {
    if (!run.pinned || !kept[i]) return;
    const boxW = 218, boxH = 50;
    const bx = Math.min(W - R - boxW, Math.max(L, x(i) - boxW / 2));
    const by = Math.max(8, y(values[i]) - 83 - (i % 2) * 52);
    chart.append(svg("line", {x1: x(i), x2: bx + boxW / 2, y1: y(values[i]) - 8, y2: by + boxH, class: "chart-callout-line"}));
    chart.append(svg("rect", {x: bx, y: by, width: boxW, height: boxH, rx: 8, class: "chart-callout"}));
    chart.append(svg("text", {x: bx + 10, y: by + 21, class: "chart-callout-title"}, String(run.title || `PR #${run.pr_number || ""}`).slice(0, 27)));
    chart.append(svg("text", {x: bx + 10, y: by + 39, class: "chart-callout-sub"}, `${run.author || "Contributor"} · +${run.gained || 0} scripts`.slice(0, 30)));
  });
}

function filteredScripts() {
  const query = filters.search.trim().toLowerCase();
  return data.scripts.filter((script) =>
    (!query || script.script_hash.includes(query) || String(script.cluster_id || "").includes(query)) &&
    (!filters.network || script.networks.includes(filters.network)) &&
    (!filters.version || script.script_type === filters.version) &&
    (!filters.status || script.status === filters.status) &&
    (!filters.purpose || script.purposes.includes(filters.purpose))
  ).sort((a, b) => (b.last_seen || 0) - (a.last_seen || 0) || a.script_hash.localeCompare(b.script_hash));
}
function renderGrid() {
  const entries = filteredScripts();
  $("#grid-count").textContent = `${entries.length.toLocaleString()} scripts`;
  const grid = $("#script-grid"); grid.replaceChildren();
  entries.slice(0, shown).forEach((script) => {
    const button = document.createElement("button");
    button.type = "button";
    button.className = `script-tile ${script.status}`;
    button.innerHTML = `<span class="tile-top"><span class="tile-version">${esc(script.script_type.replace("plutus", "Plutus "))}</span><span class="tile-status">${esc(script.status)}</span></span><span class="tile-hash">${esc(shortHash(script.script_hash))}</span><span class="tile-bottom"><span>${esc(script.networks.join(" + "))}</span><span>${Number(script.serialised_size).toLocaleString()} bytes</span><span>${esc(script.purposes.join(", ") || "purpose unknown")}</span></span>`;
    button.addEventListener("click", () => openScript(script));
    grid.append(button);
  });
  $("#show-more").hidden = entries.length <= shown;
}
function openScript(script) {
  const detail = $("#script-detail");
  const examples = script.examples.slice(0, 5).map((e) => `<li>${esc(e.network)} · ${esc(e.purpose)} · <a href="https://${e.network === "preprod" ? "preprod." : ""}cardanoscan.io/transaction/${esc(e.tx_hash)}" target="_blank" rel="noopener noreferrer">${esc(shortHash(e.tx_hash))}</a>${e.valid_contract === true ? " · valid on-chain" : ""}</li>`).join("");
  detail.innerHTML = `<div class="detail-eyebrow">${esc(script.script_type)} · ${esc(script.status)}</div><h2 id="dialog-title">Script detail</h2><div class="detail-hash">${esc(script.script_hash)}</div><div class="detail-grid"><div><span>Networks</span><strong>${esc(script.networks.join(" + "))}</strong></div><div><span>Serialized size</span><strong>${Number(script.serialised_size).toLocaleString()} bytes</strong></div><div><span>Observed purposes</span><strong>${esc(script.purposes.join(", ") || "Unknown")}</strong></div><div><span>Last observed</span><strong>${esc(formatTime(script.last_seen))}</strong></div></div><div class="detail-section"><h3>UPLC family</h3><p>${esc(script.cluster_id || "No structural family recorded")}</p></div><div class="detail-section"><h3>Observed transaction examples</h3><ul>${examples || "<li>No example recorded</li>"}</ul></div><div class="detail-section"><h3>Blaster result</h3><p>${esc(script.result?.note || (script.status === "unrun" ? "No benchmark run has been published for this script yet." : script.status))}</p></div><div class="detail-section"><a href="${repoBase}LiveScripts/S_${esc(script.script_hash)}/Properties.lean" target="_blank" rel="noopener noreferrer">Open Lean property</a> · <a href="${repoBase}LiveScripts/S_${esc(script.script_hash)}/script.cbor.hex" target="_blank" rel="noopener noreferrer">Original script CBOR</a></div>`;
  $("#script-dialog").showModal();
}
function setupFilters() {
  Object.keys(filters).forEach((key) => {
    const input = $(`#${key}`);
    input.addEventListener(key === "search" ? "input" : "change", () => {
      filters[key] = input.value.toLowerCase(); shown = 120; renderGrid();
    });
  });
  $("#show-more").addEventListener("click", () => { shown += 120; renderGrid(); });
  $("#script-dialog").addEventListener("click", (event) => { if (event.target === $("#script-dialog")) $("#script-dialog").close(); });
}
async function start() {
  try {
    const response = await fetch("data/dashboard.json", {cache: "no-store"});
    if (!response.ok) throw new Error(`Data request failed: ${response.status}`);
    data = await response.json();
    updateHeadline(); setupCohorts(); setupFilters(); renderChart(); renderGrid();
  } catch (error) {
    $("#scope-note").textContent = `Dashboard data could not be loaded: ${error.message}`;
    $("#chart-total").textContent = "Data unavailable";
    $("#grid-count").textContent = "Data unavailable";
  }
}
start();
