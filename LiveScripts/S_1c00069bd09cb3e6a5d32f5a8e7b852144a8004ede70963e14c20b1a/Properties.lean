import LiveScripts.Shared
import LiveScripts.S_1c00069bd09cb3e6a5d32f5a8e7b852144a8004ede70963e14c20b1a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1c00069bd09cb3e6a5d32f5a8e7b852144a8004ede70963e14c20b1a.script [ctx] 10000]
