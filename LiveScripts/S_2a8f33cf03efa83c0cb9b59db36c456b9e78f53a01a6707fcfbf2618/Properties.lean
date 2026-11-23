import LiveScripts.Shared
import LiveScripts.S_2a8f33cf03efa83c0cb9b59db36c456b9e78f53a01a6707fcfbf2618.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2a8f33cf03efa83c0cb9b59db36c456b9e78f53a01a6707fcfbf2618.script [ctx] 10000]
