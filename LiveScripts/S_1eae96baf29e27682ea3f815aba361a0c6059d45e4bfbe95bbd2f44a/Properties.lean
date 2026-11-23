import LiveScripts.Shared
import LiveScripts.S_1eae96baf29e27682ea3f815aba361a0c6059d45e4bfbe95bbd2f44a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1eae96baf29e27682ea3f815aba361a0c6059d45e4bfbe95bbd2f44a.script [redeemer, ctx] 10000]
