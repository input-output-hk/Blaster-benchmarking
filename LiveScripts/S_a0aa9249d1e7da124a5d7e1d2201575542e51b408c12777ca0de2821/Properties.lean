import LiveScripts.Shared
import LiveScripts.S_a0aa9249d1e7da124a5d7e1d2201575542e51b408c12777ca0de2821.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a0aa9249d1e7da124a5d7e1d2201575542e51b408c12777ca0de2821.script [ctx] 10000]
