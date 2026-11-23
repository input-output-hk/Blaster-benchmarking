import LiveScripts.Shared
import LiveScripts.S_99d2cd737b4e56c4bef1da11f9a5e15c8885c88844749dc3b9023110.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_99d2cd737b4e56c4bef1da11f9a5e15c8885c88844749dc3b9023110.script [ctx] 10000]
