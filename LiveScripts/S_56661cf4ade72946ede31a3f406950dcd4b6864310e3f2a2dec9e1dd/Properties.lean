import LiveScripts.Shared
import LiveScripts.S_56661cf4ade72946ede31a3f406950dcd4b6864310e3f2a2dec9e1dd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_56661cf4ade72946ede31a3f406950dcd4b6864310e3f2a2dec9e1dd.script [ctx] 10000]
