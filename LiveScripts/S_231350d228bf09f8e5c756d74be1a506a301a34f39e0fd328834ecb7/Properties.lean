import LiveScripts.Shared
import LiveScripts.S_231350d228bf09f8e5c756d74be1a506a301a34f39e0fd328834ecb7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_231350d228bf09f8e5c756d74be1a506a301a34f39e0fd328834ecb7.script [ctx] 10000]
