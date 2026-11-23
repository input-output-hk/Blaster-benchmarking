import LiveScripts.Shared
import LiveScripts.S_a136e6064b4735c8fb5fef739e6c9afa17176fc4ac9c0e152dc8fd86.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a136e6064b4735c8fb5fef739e6c9afa17176fc4ac9c0e152dc8fd86.script [ctx] 10000]
