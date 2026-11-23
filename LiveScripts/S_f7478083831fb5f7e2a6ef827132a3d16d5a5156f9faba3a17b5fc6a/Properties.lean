import LiveScripts.Shared
import LiveScripts.S_f7478083831fb5f7e2a6ef827132a3d16d5a5156f9faba3a17b5fc6a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f7478083831fb5f7e2a6ef827132a3d16d5a5156f9faba3a17b5fc6a.script [ctx] 10000]
