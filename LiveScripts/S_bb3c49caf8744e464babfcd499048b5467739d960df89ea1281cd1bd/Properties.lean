import LiveScripts.Shared
import LiveScripts.S_bb3c49caf8744e464babfcd499048b5467739d960df89ea1281cd1bd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bb3c49caf8744e464babfcd499048b5467739d960df89ea1281cd1bd.script [ctx] 10000]
