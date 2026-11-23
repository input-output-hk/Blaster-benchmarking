import LiveScripts.Shared
import LiveScripts.S_2c75d37c4a3e8af4bd3e1aeaf9c8b177a2de8d2539b25ef27803de88.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2c75d37c4a3e8af4bd3e1aeaf9c8b177a2de8d2539b25ef27803de88.script [ctx] 10000]
