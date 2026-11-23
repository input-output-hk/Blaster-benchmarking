import LiveScripts.Shared
import LiveScripts.S_9d622bc0bbbe7326527f6d1eb751bea6221f1dbec0716d1dbb0e863a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9d622bc0bbbe7326527f6d1eb751bea6221f1dbec0716d1dbb0e863a.script [ctx] 10000]
