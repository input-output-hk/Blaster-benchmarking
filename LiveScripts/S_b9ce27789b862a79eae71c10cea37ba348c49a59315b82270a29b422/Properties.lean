import LiveScripts.Shared
import LiveScripts.S_b9ce27789b862a79eae71c10cea37ba348c49a59315b82270a29b422.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b9ce27789b862a79eae71c10cea37ba348c49a59315b82270a29b422.script [datum, redeemer, ctx] 10000]
