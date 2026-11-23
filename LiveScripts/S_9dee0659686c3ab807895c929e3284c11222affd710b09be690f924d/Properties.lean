import LiveScripts.Shared
import LiveScripts.S_9dee0659686c3ab807895c929e3284c11222affd710b09be690f924d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9dee0659686c3ab807895c929e3284c11222affd710b09be690f924d.script [datum, redeemer, ctx] 10000]
