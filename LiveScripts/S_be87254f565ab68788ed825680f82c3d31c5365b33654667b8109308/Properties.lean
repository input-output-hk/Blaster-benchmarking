import LiveScripts.Shared
import LiveScripts.S_be87254f565ab68788ed825680f82c3d31c5365b33654667b8109308.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_be87254f565ab68788ed825680f82c3d31c5365b33654667b8109308.script [datum, redeemer, ctx] 10000]
