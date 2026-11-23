import LiveScripts.Shared
import LiveScripts.S_cbf249ebafe6bd0eddee39fb061f698030cb82fdfd77ce97d9f48559.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cbf249ebafe6bd0eddee39fb061f698030cb82fdfd77ce97d9f48559.script [ctx] 10000]
