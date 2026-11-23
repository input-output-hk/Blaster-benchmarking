import LiveScripts.Shared
import LiveScripts.S_c2c8fbdca500062cdedd5a086045573af350b77a7af70e4020c13cda.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c2c8fbdca500062cdedd5a086045573af350b77a7af70e4020c13cda.script [ctx] 10000]
