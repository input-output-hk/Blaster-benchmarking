import LiveScripts.Shared
import LiveScripts.S_c054825a0ed0bb9350b57ba5673829e817287a13c55c0a42e1bda1e9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c054825a0ed0bb9350b57ba5673829e817287a13c55c0a42e1bda1e9.script [ctx] 10000]
