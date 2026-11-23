import LiveScripts.Shared
import LiveScripts.S_07612af0238919677b528aa5e5f679f93d605e1f60b4d3ea3459e91c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_07612af0238919677b528aa5e5f679f93d605e1f60b4d3ea3459e91c.script [ctx] 10000]
