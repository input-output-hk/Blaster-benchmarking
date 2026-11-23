import LiveScripts.Shared
import LiveScripts.S_183c4a87c60857a600aea120cf90ab4bba73c5138a288b795c40f325.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_183c4a87c60857a600aea120cf90ab4bba73c5138a288b795c40f325.script [ctx] 10000]
