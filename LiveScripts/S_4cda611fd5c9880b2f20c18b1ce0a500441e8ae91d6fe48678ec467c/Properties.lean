import LiveScripts.Shared
import LiveScripts.S_4cda611fd5c9880b2f20c18b1ce0a500441e8ae91d6fe48678ec467c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4cda611fd5c9880b2f20c18b1ce0a500441e8ae91d6fe48678ec467c.script [ctx] 10000]
