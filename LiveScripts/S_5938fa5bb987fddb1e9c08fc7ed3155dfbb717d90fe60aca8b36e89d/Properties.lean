import LiveScripts.Shared
import LiveScripts.S_5938fa5bb987fddb1e9c08fc7ed3155dfbb717d90fe60aca8b36e89d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5938fa5bb987fddb1e9c08fc7ed3155dfbb717d90fe60aca8b36e89d.script [datum, redeemer, ctx] 10000]
