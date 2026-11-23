import LiveScripts.Shared
import LiveScripts.S_fc7766e8d1fbd521c9fecc6b1cc7d2d08ece2cb1968160659d9f9b42.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fc7766e8d1fbd521c9fecc6b1cc7d2d08ece2cb1968160659d9f9b42.script [redeemer, ctx] 10000]
