import LiveScripts.Shared
import LiveScripts.S_d4dc69da729a9daec34cb402d93f6a1a0e8ed8909b3137829426773c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d4dc69da729a9daec34cb402d93f6a1a0e8ed8909b3137829426773c.script [ctx] 10000]
