import LiveScripts.Shared
import LiveScripts.S_9aa880b46f8b66197cc3d401e64ba48c05b4e3e026798e488fa04131.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9aa880b46f8b66197cc3d401e64ba48c05b4e3e026798e488fa04131.script [ctx] 10000]
