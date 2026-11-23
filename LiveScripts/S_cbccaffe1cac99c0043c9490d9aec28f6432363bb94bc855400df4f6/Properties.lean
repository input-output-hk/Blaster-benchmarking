import LiveScripts.Shared
import LiveScripts.S_cbccaffe1cac99c0043c9490d9aec28f6432363bb94bc855400df4f6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cbccaffe1cac99c0043c9490d9aec28f6432363bb94bc855400df4f6.script [ctx] 10000]
