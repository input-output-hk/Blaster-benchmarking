import LiveScripts.Shared
import LiveScripts.S_c118e8085de87a2b5b40fca831bfc019054876367715dcd3e01d5ca6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c118e8085de87a2b5b40fca831bfc019054876367715dcd3e01d5ca6.script [datum, redeemer, ctx] 10000]
