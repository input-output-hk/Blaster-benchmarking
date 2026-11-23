import LiveScripts.Shared
import LiveScripts.S_f0161f762272173e1a9e5846eaa1e21c16741dd71fa28f70b0b2ac0b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f0161f762272173e1a9e5846eaa1e21c16741dd71fa28f70b0b2ac0b.script [ctx] 10000]
