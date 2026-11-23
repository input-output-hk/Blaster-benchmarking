import LiveScripts.Shared
import LiveScripts.S_e8ded9661d13c56a711b1d82e8a10035a7cc713c5d4c94a9ba41b896.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e8ded9661d13c56a711b1d82e8a10035a7cc713c5d4c94a9ba41b896.script [datum, redeemer, ctx] 10000]
