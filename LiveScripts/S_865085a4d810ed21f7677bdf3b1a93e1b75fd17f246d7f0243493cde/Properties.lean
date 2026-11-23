import LiveScripts.Shared
import LiveScripts.S_865085a4d810ed21f7677bdf3b1a93e1b75fd17f246d7f0243493cde.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_865085a4d810ed21f7677bdf3b1a93e1b75fd17f246d7f0243493cde.script [datum, redeemer, ctx] 10000]
