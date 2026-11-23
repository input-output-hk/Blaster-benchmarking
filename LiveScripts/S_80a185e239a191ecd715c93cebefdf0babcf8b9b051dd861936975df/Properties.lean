import LiveScripts.Shared
import LiveScripts.S_80a185e239a191ecd715c93cebefdf0babcf8b9b051dd861936975df.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_80a185e239a191ecd715c93cebefdf0babcf8b9b051dd861936975df.script [datum, redeemer, ctx] 10000]
