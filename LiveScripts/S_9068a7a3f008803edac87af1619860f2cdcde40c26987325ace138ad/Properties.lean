import LiveScripts.Shared
import LiveScripts.S_9068a7a3f008803edac87af1619860f2cdcde40c26987325ace138ad.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9068a7a3f008803edac87af1619860f2cdcde40c26987325ace138ad.script [datum, redeemer, ctx] 10000]
