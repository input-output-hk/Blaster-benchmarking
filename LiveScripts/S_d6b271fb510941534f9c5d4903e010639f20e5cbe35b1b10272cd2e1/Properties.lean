import LiveScripts.Shared
import LiveScripts.S_d6b271fb510941534f9c5d4903e010639f20e5cbe35b1b10272cd2e1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d6b271fb510941534f9c5d4903e010639f20e5cbe35b1b10272cd2e1.script [datum, redeemer, ctx] 10000]
