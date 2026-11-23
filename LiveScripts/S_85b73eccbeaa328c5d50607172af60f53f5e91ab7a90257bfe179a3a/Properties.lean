import LiveScripts.Shared
import LiveScripts.S_85b73eccbeaa328c5d50607172af60f53f5e91ab7a90257bfe179a3a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_85b73eccbeaa328c5d50607172af60f53f5e91ab7a90257bfe179a3a.script [ctx] 10000]
