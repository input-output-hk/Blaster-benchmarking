import LiveScripts.Shared
import LiveScripts.S_4f12326c15c19928f6618888572016d096e3bdc98a2d5cb1b6b41666.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4f12326c15c19928f6618888572016d096e3bdc98a2d5cb1b6b41666.script [datum, redeemer, ctx] 10000]
