import LiveScripts.Shared
import LiveScripts.S_6cddb38e4842c6a9dc688b9b176e9f4d938c5e0ce36b9ac3edf6aa63.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6cddb38e4842c6a9dc688b9b176e9f4d938c5e0ce36b9ac3edf6aa63.script [ctx] 10000]
