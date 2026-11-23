import LiveScripts.Shared
import LiveScripts.S_e90035a672b3c21de896ffdab676870c8e71bee3f99911c0e9313eff.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e90035a672b3c21de896ffdab676870c8e71bee3f99911c0e9313eff.script [ctx] 10000]
