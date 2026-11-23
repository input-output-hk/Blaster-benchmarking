import LiveScripts.Shared
import LiveScripts.S_f883025f0180f1221377a749464a3f6861e7dd71b9542cf3b915090a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f883025f0180f1221377a749464a3f6861e7dd71b9542cf3b915090a.script [ctx] 10000]
