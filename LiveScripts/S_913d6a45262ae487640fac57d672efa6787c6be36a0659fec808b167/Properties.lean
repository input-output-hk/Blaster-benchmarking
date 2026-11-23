import LiveScripts.Shared
import LiveScripts.S_913d6a45262ae487640fac57d672efa6787c6be36a0659fec808b167.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_913d6a45262ae487640fac57d672efa6787c6be36a0659fec808b167.script [datum, redeemer, ctx] 10000]
