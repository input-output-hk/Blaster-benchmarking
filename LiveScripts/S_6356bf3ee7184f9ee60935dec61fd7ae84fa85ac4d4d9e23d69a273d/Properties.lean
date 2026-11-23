import LiveScripts.Shared
import LiveScripts.S_6356bf3ee7184f9ee60935dec61fd7ae84fa85ac4d4d9e23d69a273d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6356bf3ee7184f9ee60935dec61fd7ae84fa85ac4d4d9e23d69a273d.script [ctx] 10000]
