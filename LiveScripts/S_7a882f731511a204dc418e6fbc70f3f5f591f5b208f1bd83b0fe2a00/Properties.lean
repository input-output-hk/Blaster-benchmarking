import LiveScripts.Shared
import LiveScripts.S_7a882f731511a204dc418e6fbc70f3f5f591f5b208f1bd83b0fe2a00.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7a882f731511a204dc418e6fbc70f3f5f591f5b208f1bd83b0fe2a00.script [ctx] 10000]
