import LiveScripts.Shared
import LiveScripts.S_7de3a8f2aa307ba6899a13caf05dbdade5d67929647a8f7bb0dde019.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7de3a8f2aa307ba6899a13caf05dbdade5d67929647a8f7bb0dde019.script [ctx] 10000]
