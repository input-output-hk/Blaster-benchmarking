import LiveScripts.Shared
import LiveScripts.S_15032920660d3c43a310182a3b4c1cc90779c199143cc6c47e114bbc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_15032920660d3c43a310182a3b4c1cc90779c199143cc6c47e114bbc.script [ctx] 10000]
