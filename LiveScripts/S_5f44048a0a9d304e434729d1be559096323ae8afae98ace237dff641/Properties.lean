import LiveScripts.Shared
import LiveScripts.S_5f44048a0a9d304e434729d1be559096323ae8afae98ace237dff641.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5f44048a0a9d304e434729d1be559096323ae8afae98ace237dff641.script [datum, redeemer, ctx] 10000]
