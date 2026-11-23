import LiveScripts.Shared
import LiveScripts.S_3c08b8f72fc545d5be6fc129380e015642f205facea045fd1224670b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3c08b8f72fc545d5be6fc129380e015642f205facea045fd1224670b.script [ctx] 10000]
