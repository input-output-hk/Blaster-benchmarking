import LiveScripts.Shared
import LiveScripts.S_1baf0942a97a3033b517a1e3baa7ac5316fb4c4302d89638892f6793.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1baf0942a97a3033b517a1e3baa7ac5316fb4c4302d89638892f6793.script [ctx] 10000]
