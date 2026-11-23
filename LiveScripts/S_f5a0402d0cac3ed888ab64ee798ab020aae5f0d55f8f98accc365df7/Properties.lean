import LiveScripts.Shared
import LiveScripts.S_f5a0402d0cac3ed888ab64ee798ab020aae5f0d55f8f98accc365df7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f5a0402d0cac3ed888ab64ee798ab020aae5f0d55f8f98accc365df7.script [ctx] 10000]
