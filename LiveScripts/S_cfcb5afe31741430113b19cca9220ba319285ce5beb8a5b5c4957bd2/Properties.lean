import LiveScripts.Shared
import LiveScripts.S_cfcb5afe31741430113b19cca9220ba319285ce5beb8a5b5c4957bd2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cfcb5afe31741430113b19cca9220ba319285ce5beb8a5b5c4957bd2.script [ctx] 10000]
