import LiveScripts.Shared
import LiveScripts.S_078facd406708042cfaf9ce02144e4c9b440ee4b9a6bf086d41e92eb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_078facd406708042cfaf9ce02144e4c9b440ee4b9a6bf086d41e92eb.script [datum, redeemer, ctx] 10000]
