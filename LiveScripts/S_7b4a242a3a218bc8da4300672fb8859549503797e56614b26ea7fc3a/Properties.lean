import LiveScripts.Shared
import LiveScripts.S_7b4a242a3a218bc8da4300672fb8859549503797e56614b26ea7fc3a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7b4a242a3a218bc8da4300672fb8859549503797e56614b26ea7fc3a.script [ctx] 10000]
