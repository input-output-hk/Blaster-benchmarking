import LiveScripts.Shared
import LiveScripts.S_95eaacbabd6559f92850d36d411ce3f32c486195dbc428f26ce50ea2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_95eaacbabd6559f92850d36d411ce3f32c486195dbc428f26ce50ea2.script [datum, redeemer, ctx] 10000]
