import LiveScripts.Shared
import LiveScripts.S_f67826945f6bbbe95a953240db6750ff76de9f60b7d7d449101df214.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f67826945f6bbbe95a953240db6750ff76de9f60b7d7d449101df214.script [ctx] 10000]
