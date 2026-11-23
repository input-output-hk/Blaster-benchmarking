import LiveScripts.Shared
import LiveScripts.S_15c964b8c763ee1a9cd0159a3e490404fd5b4fe1ef6ff88f6b45a7ed.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_15c964b8c763ee1a9cd0159a3e490404fd5b4fe1ef6ff88f6b45a7ed.script [ctx] 10000]
