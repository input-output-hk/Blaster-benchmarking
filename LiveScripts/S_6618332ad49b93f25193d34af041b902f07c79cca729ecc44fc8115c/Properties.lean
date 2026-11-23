import LiveScripts.Shared
import LiveScripts.S_6618332ad49b93f25193d34af041b902f07c79cca729ecc44fc8115c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6618332ad49b93f25193d34af041b902f07c79cca729ecc44fc8115c.script [ctx] 10000]
