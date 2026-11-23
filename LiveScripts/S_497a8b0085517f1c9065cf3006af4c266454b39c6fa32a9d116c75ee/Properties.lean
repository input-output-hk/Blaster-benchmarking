import LiveScripts.Shared
import LiveScripts.S_497a8b0085517f1c9065cf3006af4c266454b39c6fa32a9d116c75ee.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_497a8b0085517f1c9065cf3006af4c266454b39c6fa32a9d116c75ee.script [ctx] 10000]
