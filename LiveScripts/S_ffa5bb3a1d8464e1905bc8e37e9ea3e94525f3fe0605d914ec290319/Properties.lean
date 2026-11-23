import LiveScripts.Shared
import LiveScripts.S_ffa5bb3a1d8464e1905bc8e37e9ea3e94525f3fe0605d914ec290319.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ffa5bb3a1d8464e1905bc8e37e9ea3e94525f3fe0605d914ec290319.script [datum, redeemer, ctx] 10000]
