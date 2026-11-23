import LiveScripts.Shared
import LiveScripts.S_f83cc115cc6799736b67a05dec8d99c002bee59a840d07e6d4a8c161.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f83cc115cc6799736b67a05dec8d99c002bee59a840d07e6d4a8c161.script [ctx] 10000]
