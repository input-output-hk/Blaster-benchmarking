import LiveScripts.Shared
import LiveScripts.S_a4a93eaf0d3c6baf032eded84caefd8d850aad633a3920f7d858dfeb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a4a93eaf0d3c6baf032eded84caefd8d850aad633a3920f7d858dfeb.script [datum, redeemer, ctx] 10000]
