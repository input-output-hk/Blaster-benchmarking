import LiveScripts.Shared
import LiveScripts.S_4ab17afc9a19a4f06b6fe229f9501e727d3968bff03acb1a8f86acf5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4ab17afc9a19a4f06b6fe229f9501e727d3968bff03acb1a8f86acf5.script [datum, redeemer, ctx] 10000]
