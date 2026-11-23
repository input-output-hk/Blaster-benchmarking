import LiveScripts.Shared
import LiveScripts.S_875bb27292d9a985d012af5e9d25507155adf37cc969969c87813bca.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_875bb27292d9a985d012af5e9d25507155adf37cc969969c87813bca.script [datum, redeemer, ctx] 10000]
