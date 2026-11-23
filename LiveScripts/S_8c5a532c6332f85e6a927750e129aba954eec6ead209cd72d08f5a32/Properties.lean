import LiveScripts.Shared
import LiveScripts.S_8c5a532c6332f85e6a927750e129aba954eec6ead209cd72d08f5a32.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8c5a532c6332f85e6a927750e129aba954eec6ead209cd72d08f5a32.script [datum, redeemer, ctx] 10000]
