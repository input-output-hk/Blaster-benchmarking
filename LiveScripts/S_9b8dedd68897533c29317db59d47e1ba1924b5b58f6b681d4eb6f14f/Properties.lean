import LiveScripts.Shared
import LiveScripts.S_9b8dedd68897533c29317db59d47e1ba1924b5b58f6b681d4eb6f14f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9b8dedd68897533c29317db59d47e1ba1924b5b58f6b681d4eb6f14f.script [ctx] 10000]
