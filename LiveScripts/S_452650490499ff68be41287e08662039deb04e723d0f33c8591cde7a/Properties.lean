import LiveScripts.Shared
import LiveScripts.S_452650490499ff68be41287e08662039deb04e723d0f33c8591cde7a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_452650490499ff68be41287e08662039deb04e723d0f33c8591cde7a.script [datum, redeemer, ctx] 10000]
