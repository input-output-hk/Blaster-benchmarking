import LiveScripts.Shared
import LiveScripts.S_c1b47001fbd36f891f5f038c8e2de77492a79d0a48d51d2faefe3baa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c1b47001fbd36f891f5f038c8e2de77492a79d0a48d51d2faefe3baa.script [ctx] 10000]
