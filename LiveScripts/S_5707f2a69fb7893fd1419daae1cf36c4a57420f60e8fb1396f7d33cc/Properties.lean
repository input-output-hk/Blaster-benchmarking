import LiveScripts.Shared
import LiveScripts.S_5707f2a69fb7893fd1419daae1cf36c4a57420f60e8fb1396f7d33cc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5707f2a69fb7893fd1419daae1cf36c4a57420f60e8fb1396f7d33cc.script [datum, redeemer, ctx] 10000]
