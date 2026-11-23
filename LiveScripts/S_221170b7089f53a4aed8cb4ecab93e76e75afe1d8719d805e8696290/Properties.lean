import LiveScripts.Shared
import LiveScripts.S_221170b7089f53a4aed8cb4ecab93e76e75afe1d8719d805e8696290.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_221170b7089f53a4aed8cb4ecab93e76e75afe1d8719d805e8696290.script [ctx] 10000]
