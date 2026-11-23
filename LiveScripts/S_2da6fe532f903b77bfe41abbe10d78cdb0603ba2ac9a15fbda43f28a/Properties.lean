import LiveScripts.Shared
import LiveScripts.S_2da6fe532f903b77bfe41abbe10d78cdb0603ba2ac9a15fbda43f28a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2da6fe532f903b77bfe41abbe10d78cdb0603ba2ac9a15fbda43f28a.script [ctx] 10000]
