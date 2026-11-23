import LiveScripts.Shared
import LiveScripts.S_eeea2dd2ce5fd8a9817c3d03a4106753cd1bdc61864bfc6ab8bd511e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_eeea2dd2ce5fd8a9817c3d03a4106753cd1bdc61864bfc6ab8bd511e.script [ctx] 10000]
