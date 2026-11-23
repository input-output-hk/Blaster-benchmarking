import LiveScripts.Shared
import LiveScripts.S_021a32ee5621d4e94df1d9bef6baa284a7cc75ba51bb5fb804c6c471.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_021a32ee5621d4e94df1d9bef6baa284a7cc75ba51bb5fb804c6c471.script [datum, redeemer, ctx] 10000]
