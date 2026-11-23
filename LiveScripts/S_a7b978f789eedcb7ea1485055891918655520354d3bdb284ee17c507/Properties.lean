import LiveScripts.Shared
import LiveScripts.S_a7b978f789eedcb7ea1485055891918655520354d3bdb284ee17c507.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a7b978f789eedcb7ea1485055891918655520354d3bdb284ee17c507.script [ctx] 10000]
