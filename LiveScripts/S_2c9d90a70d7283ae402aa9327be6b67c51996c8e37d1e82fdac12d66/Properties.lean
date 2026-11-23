import LiveScripts.Shared
import LiveScripts.S_2c9d90a70d7283ae402aa9327be6b67c51996c8e37d1e82fdac12d66.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2c9d90a70d7283ae402aa9327be6b67c51996c8e37d1e82fdac12d66.script [ctx] 10000]
