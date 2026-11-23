import LiveScripts.Shared
import LiveScripts.S_248d74fdf2a0fee9cd179d53fd7a7e0e17c677588d5a64f0707e186e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_248d74fdf2a0fee9cd179d53fd7a7e0e17c677588d5a64f0707e186e.script [redeemer, ctx] 10000]
