import LiveScripts.Shared
import LiveScripts.S_7cbc2f19129efbc1b3eb372197de51fe2295fe553ddc733bae2f162d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7cbc2f19129efbc1b3eb372197de51fe2295fe553ddc733bae2f162d.script [ctx] 10000]
