import LiveScripts.Shared
import LiveScripts.S_4df579e1822b967c50057bc6d11a778a82bc88e3bbf1397482931668.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4df579e1822b967c50057bc6d11a778a82bc88e3bbf1397482931668.script [redeemer, ctx] 10000]
