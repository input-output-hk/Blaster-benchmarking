import LiveScripts.Shared
import LiveScripts.S_823f1cec85cd77670330b42ff6ed1ccd5e622107201c3b8ec3eaab4a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_823f1cec85cd77670330b42ff6ed1ccd5e622107201c3b8ec3eaab4a.script [ctx] 10000]
