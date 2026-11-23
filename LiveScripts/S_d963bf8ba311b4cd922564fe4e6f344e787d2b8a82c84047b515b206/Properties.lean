import LiveScripts.Shared
import LiveScripts.S_d963bf8ba311b4cd922564fe4e6f344e787d2b8a82c84047b515b206.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d963bf8ba311b4cd922564fe4e6f344e787d2b8a82c84047b515b206.script [ctx] 10000]
