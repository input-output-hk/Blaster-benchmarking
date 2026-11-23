import LiveScripts.Shared
import LiveScripts.S_0f4b3c952d093e40448124665efb7e8c1a35b4130f97fbb012bb74ed.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0f4b3c952d093e40448124665efb7e8c1a35b4130f97fbb012bb74ed.script [datum, redeemer, ctx] 10000]
