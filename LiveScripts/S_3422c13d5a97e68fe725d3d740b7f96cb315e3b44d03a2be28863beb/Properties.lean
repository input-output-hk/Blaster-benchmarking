import LiveScripts.Shared
import LiveScripts.S_3422c13d5a97e68fe725d3d740b7f96cb315e3b44d03a2be28863beb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3422c13d5a97e68fe725d3d740b7f96cb315e3b44d03a2be28863beb.script [datum, redeemer, ctx] 10000]
