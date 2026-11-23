import LiveScripts.Shared
import LiveScripts.S_6bf6754a78757e77cc99d6d0202262d26b555591be79310f0346dcb6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6bf6754a78757e77cc99d6d0202262d26b555591be79310f0346dcb6.script [ctx] 10000]
