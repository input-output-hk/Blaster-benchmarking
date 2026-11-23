import LiveScripts.Shared
import LiveScripts.S_4a688ab65f839782067d1280c545476c981738311fa9b7954fb03bfa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4a688ab65f839782067d1280c545476c981738311fa9b7954fb03bfa.script [ctx] 10000]
