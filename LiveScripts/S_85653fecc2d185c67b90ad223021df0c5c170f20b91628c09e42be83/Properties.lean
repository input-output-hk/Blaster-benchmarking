import LiveScripts.Shared
import LiveScripts.S_85653fecc2d185c67b90ad223021df0c5c170f20b91628c09e42be83.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_85653fecc2d185c67b90ad223021df0c5c170f20b91628c09e42be83.script [ctx] 10000]
