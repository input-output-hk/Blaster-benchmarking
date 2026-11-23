import LiveScripts.Shared
import LiveScripts.S_f3ef5d4b3828678e58f4d1bc4300bbeb4b6265e08a3a4b164c468b56.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f3ef5d4b3828678e58f4d1bc4300bbeb4b6265e08a3a4b164c468b56.script [ctx] 10000]
