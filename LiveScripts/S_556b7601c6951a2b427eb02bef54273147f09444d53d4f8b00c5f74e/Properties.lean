import LiveScripts.Shared
import LiveScripts.S_556b7601c6951a2b427eb02bef54273147f09444d53d4f8b00c5f74e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_556b7601c6951a2b427eb02bef54273147f09444d53d4f8b00c5f74e.script [ctx] 10000]
