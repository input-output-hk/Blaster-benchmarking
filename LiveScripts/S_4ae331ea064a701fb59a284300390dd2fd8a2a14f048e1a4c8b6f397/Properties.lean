import LiveScripts.Shared
import LiveScripts.S_4ae331ea064a701fb59a284300390dd2fd8a2a14f048e1a4c8b6f397.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4ae331ea064a701fb59a284300390dd2fd8a2a14f048e1a4c8b6f397.script [ctx] 10000]
