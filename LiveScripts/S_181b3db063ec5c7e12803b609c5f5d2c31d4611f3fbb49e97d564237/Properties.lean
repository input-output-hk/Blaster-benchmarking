import LiveScripts.Shared
import LiveScripts.S_181b3db063ec5c7e12803b609c5f5d2c31d4611f3fbb49e97d564237.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_181b3db063ec5c7e12803b609c5f5d2c31d4611f3fbb49e97d564237.script [ctx] 10000]
