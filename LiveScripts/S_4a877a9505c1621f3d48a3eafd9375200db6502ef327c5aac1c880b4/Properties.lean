import LiveScripts.Shared
import LiveScripts.S_4a877a9505c1621f3d48a3eafd9375200db6502ef327c5aac1c880b4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4a877a9505c1621f3d48a3eafd9375200db6502ef327c5aac1c880b4.script [ctx] 10000]
