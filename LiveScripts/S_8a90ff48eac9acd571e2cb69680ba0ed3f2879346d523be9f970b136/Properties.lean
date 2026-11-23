import LiveScripts.Shared
import LiveScripts.S_8a90ff48eac9acd571e2cb69680ba0ed3f2879346d523be9f970b136.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8a90ff48eac9acd571e2cb69680ba0ed3f2879346d523be9f970b136.script [ctx] 10000]
