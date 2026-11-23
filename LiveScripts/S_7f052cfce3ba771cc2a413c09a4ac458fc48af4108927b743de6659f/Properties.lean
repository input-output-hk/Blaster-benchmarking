import LiveScripts.Shared
import LiveScripts.S_7f052cfce3ba771cc2a413c09a4ac458fc48af4108927b743de6659f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7f052cfce3ba771cc2a413c09a4ac458fc48af4108927b743de6659f.script [ctx] 10000]
