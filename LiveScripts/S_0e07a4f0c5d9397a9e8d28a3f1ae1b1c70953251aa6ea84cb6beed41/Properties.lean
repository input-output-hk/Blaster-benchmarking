import LiveScripts.Shared
import LiveScripts.S_0e07a4f0c5d9397a9e8d28a3f1ae1b1c70953251aa6ea84cb6beed41.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0e07a4f0c5d9397a9e8d28a3f1ae1b1c70953251aa6ea84cb6beed41.script [ctx] 10000]
