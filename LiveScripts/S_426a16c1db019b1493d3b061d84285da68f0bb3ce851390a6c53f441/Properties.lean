import LiveScripts.Shared
import LiveScripts.S_426a16c1db019b1493d3b061d84285da68f0bb3ce851390a6c53f441.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_426a16c1db019b1493d3b061d84285da68f0bb3ce851390a6c53f441.script [redeemer, ctx] 10000]
