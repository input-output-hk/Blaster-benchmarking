import LiveScripts.Shared
import LiveScripts.S_f021c77ce8f33e44a37d8e4d5ebabd249c9bb5abab0132cb2753a355.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f021c77ce8f33e44a37d8e4d5ebabd249c9bb5abab0132cb2753a355.script [ctx] 10000]
