import LiveScripts.Shared
import LiveScripts.S_33a8bb1748d2524b9cbca49bf9ed0a2754c495f5069176357e47cc64.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_33a8bb1748d2524b9cbca49bf9ed0a2754c495f5069176357e47cc64.script [ctx] 10000]
