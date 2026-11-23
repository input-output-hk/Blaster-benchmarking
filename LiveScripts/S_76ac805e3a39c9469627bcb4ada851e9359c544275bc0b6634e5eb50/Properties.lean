import LiveScripts.Shared
import LiveScripts.S_76ac805e3a39c9469627bcb4ada851e9359c544275bc0b6634e5eb50.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_76ac805e3a39c9469627bcb4ada851e9359c544275bc0b6634e5eb50.script [datum, redeemer, ctx] 10000]
