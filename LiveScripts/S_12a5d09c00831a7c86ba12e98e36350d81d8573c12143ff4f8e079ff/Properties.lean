import LiveScripts.Shared
import LiveScripts.S_12a5d09c00831a7c86ba12e98e36350d81d8573c12143ff4f8e079ff.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_12a5d09c00831a7c86ba12e98e36350d81d8573c12143ff4f8e079ff.script [ctx] 10000]
