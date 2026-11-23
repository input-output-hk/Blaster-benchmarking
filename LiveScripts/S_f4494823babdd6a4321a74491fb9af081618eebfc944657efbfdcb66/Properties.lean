import LiveScripts.Shared
import LiveScripts.S_f4494823babdd6a4321a74491fb9af081618eebfc944657efbfdcb66.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f4494823babdd6a4321a74491fb9af081618eebfc944657efbfdcb66.script [ctx] 10000]
