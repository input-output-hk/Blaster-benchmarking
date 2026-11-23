import LiveScripts.Shared
import LiveScripts.S_0cfea4e76e9e7c84fa225b8f79813289f08780620891c156507ebfd4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0cfea4e76e9e7c84fa225b8f79813289f08780620891c156507ebfd4.script [ctx] 10000]
