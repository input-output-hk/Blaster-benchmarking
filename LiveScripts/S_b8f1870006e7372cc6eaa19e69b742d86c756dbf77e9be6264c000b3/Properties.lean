import LiveScripts.Shared
import LiveScripts.S_b8f1870006e7372cc6eaa19e69b742d86c756dbf77e9be6264c000b3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b8f1870006e7372cc6eaa19e69b742d86c756dbf77e9be6264c000b3.script [ctx] 10000]
