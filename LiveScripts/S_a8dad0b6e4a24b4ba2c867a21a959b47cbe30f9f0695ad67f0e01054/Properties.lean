import LiveScripts.Shared
import LiveScripts.S_a8dad0b6e4a24b4ba2c867a21a959b47cbe30f9f0695ad67f0e01054.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a8dad0b6e4a24b4ba2c867a21a959b47cbe30f9f0695ad67f0e01054.script [ctx] 10000]
