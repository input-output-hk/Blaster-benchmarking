import LiveScripts.Shared
import LiveScripts.S_859075f221d672187f5fff95fc3a4be995238509ef124e8e2d85ffac.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_859075f221d672187f5fff95fc3a4be995238509ef124e8e2d85ffac.script [ctx] 10000]
