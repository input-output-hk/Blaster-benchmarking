import LiveScripts.Shared
import LiveScripts.S_b4b42df4cb70c7442c8bd0d25b1aa4e5f2efcadf4499961a36d532b5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b4b42df4cb70c7442c8bd0d25b1aa4e5f2efcadf4499961a36d532b5.script [datum, redeemer, ctx] 10000]
