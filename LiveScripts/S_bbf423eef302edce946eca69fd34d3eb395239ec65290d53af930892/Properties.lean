import LiveScripts.Shared
import LiveScripts.S_bbf423eef302edce946eca69fd34d3eb395239ec65290d53af930892.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bbf423eef302edce946eca69fd34d3eb395239ec65290d53af930892.script [redeemer, ctx] 10000]
