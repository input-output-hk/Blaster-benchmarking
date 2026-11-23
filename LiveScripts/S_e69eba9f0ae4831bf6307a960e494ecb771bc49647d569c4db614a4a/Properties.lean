import LiveScripts.Shared
import LiveScripts.S_e69eba9f0ae4831bf6307a960e494ecb771bc49647d569c4db614a4a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e69eba9f0ae4831bf6307a960e494ecb771bc49647d569c4db614a4a.script [ctx] 10000]
