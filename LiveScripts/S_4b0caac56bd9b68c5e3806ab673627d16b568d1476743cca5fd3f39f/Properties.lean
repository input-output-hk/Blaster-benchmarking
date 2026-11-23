import LiveScripts.Shared
import LiveScripts.S_4b0caac56bd9b68c5e3806ab673627d16b568d1476743cca5fd3f39f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4b0caac56bd9b68c5e3806ab673627d16b568d1476743cca5fd3f39f.script [ctx] 10000]
