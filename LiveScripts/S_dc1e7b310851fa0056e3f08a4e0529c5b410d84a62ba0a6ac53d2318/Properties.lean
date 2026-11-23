import LiveScripts.Shared
import LiveScripts.S_dc1e7b310851fa0056e3f08a4e0529c5b410d84a62ba0a6ac53d2318.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dc1e7b310851fa0056e3f08a4e0529c5b410d84a62ba0a6ac53d2318.script [datum, redeemer, ctx] 10000]
