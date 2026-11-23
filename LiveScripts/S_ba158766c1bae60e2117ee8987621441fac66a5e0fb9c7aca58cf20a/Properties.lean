import LiveScripts.Shared
import LiveScripts.S_ba158766c1bae60e2117ee8987621441fac66a5e0fb9c7aca58cf20a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ba158766c1bae60e2117ee8987621441fac66a5e0fb9c7aca58cf20a.script [datum, redeemer, ctx] 10000]
