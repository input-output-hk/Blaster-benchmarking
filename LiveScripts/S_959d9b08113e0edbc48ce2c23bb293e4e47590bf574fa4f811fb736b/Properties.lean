import LiveScripts.Shared
import LiveScripts.S_959d9b08113e0edbc48ce2c23bb293e4e47590bf574fa4f811fb736b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_959d9b08113e0edbc48ce2c23bb293e4e47590bf574fa4f811fb736b.script [datum, redeemer, ctx] 10000]
