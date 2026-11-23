import LiveScripts.Shared
import LiveScripts.S_464eeee89f05aff787d40045af2a40a83fd96c513197d32fbc54ff02.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_464eeee89f05aff787d40045af2a40a83fd96c513197d32fbc54ff02.script [datum, redeemer, ctx] 10000]
