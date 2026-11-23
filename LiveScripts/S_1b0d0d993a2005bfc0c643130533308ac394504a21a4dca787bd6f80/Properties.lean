import LiveScripts.Shared
import LiveScripts.S_1b0d0d993a2005bfc0c643130533308ac394504a21a4dca787bd6f80.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1b0d0d993a2005bfc0c643130533308ac394504a21a4dca787bd6f80.script [ctx] 10000]
