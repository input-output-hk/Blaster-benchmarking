import LiveScripts.Shared
import LiveScripts.S_2e787b1c62dc72754d0552b6605fce496c06251b73e6fc4503b3235b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2e787b1c62dc72754d0552b6605fce496c06251b73e6fc4503b3235b.script [datum, redeemer, ctx] 10000]
