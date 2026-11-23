import LiveScripts.Shared
import LiveScripts.S_c6b1d0882143b80af3a88936d1d4744de4684e6948d8ab419204012d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c6b1d0882143b80af3a88936d1d4744de4684e6948d8ab419204012d.script [datum, redeemer, ctx] 10000]
