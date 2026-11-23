import LiveScripts.Shared
import LiveScripts.S_5c54b2070b248c4036c0e4aae07a33bf154593ee6ea608d8215d86b8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5c54b2070b248c4036c0e4aae07a33bf154593ee6ea608d8215d86b8.script [ctx] 10000]
