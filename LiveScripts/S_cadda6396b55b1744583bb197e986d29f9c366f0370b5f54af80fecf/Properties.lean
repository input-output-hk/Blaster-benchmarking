import LiveScripts.Shared
import LiveScripts.S_cadda6396b55b1744583bb197e986d29f9c366f0370b5f54af80fecf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cadda6396b55b1744583bb197e986d29f9c366f0370b5f54af80fecf.script [ctx] 10000]
