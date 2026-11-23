import LiveScripts.Shared
import LiveScripts.S_74f47b9b70c7fd73b5bd31cf4514fd7a1ff0839daf62aa2c56b5211a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_74f47b9b70c7fd73b5bd31cf4514fd7a1ff0839daf62aa2c56b5211a.script [redeemer, ctx] 10000]
