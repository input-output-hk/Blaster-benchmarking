import LiveScripts.Shared
import LiveScripts.S_aa1cbea2524d369768283d7c8300755880fd071194a347cf0a4e274f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_aa1cbea2524d369768283d7c8300755880fd071194a347cf0a4e274f.script [ctx] 10000]
