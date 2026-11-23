import LiveScripts.Shared
import LiveScripts.S_94f83d26e0f0312685c63c30fd92bbfcc8d1ce0833d6c0b2d08e34fc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_94f83d26e0f0312685c63c30fd92bbfcc8d1ce0833d6c0b2d08e34fc.script [ctx] 10000]
