import LiveScripts.Shared
import LiveScripts.S_5854ec667761c57872a7effd31494c3a0daba1d35e8377e02d326a27.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5854ec667761c57872a7effd31494c3a0daba1d35e8377e02d326a27.script [datum, redeemer, ctx] 10000]
