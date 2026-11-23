import LiveScripts.Shared
import LiveScripts.S_d8cf22bbfa3900e3cce2e5f4e4996a2a061738129e4c21681f1734a4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d8cf22bbfa3900e3cce2e5f4e4996a2a061738129e4c21681f1734a4.script [datum, redeemer, ctx] 10000]
