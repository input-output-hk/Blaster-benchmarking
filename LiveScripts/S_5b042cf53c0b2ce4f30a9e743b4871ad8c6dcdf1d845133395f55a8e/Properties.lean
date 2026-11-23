import LiveScripts.Shared
import LiveScripts.S_5b042cf53c0b2ce4f30a9e743b4871ad8c6dcdf1d845133395f55a8e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5b042cf53c0b2ce4f30a9e743b4871ad8c6dcdf1d845133395f55a8e.script [redeemer, ctx] 10000]
