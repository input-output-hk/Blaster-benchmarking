import LiveScripts.Shared
import LiveScripts.S_9c2349088e01d5268a3dd7b4152923b4620514389bdacda98ddf943f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9c2349088e01d5268a3dd7b4152923b4620514389bdacda98ddf943f.script [ctx] 10000]
