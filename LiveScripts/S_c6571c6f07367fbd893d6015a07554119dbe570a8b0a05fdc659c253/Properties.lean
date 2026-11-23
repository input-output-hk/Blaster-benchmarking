import LiveScripts.Shared
import LiveScripts.S_c6571c6f07367fbd893d6015a07554119dbe570a8b0a05fdc659c253.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c6571c6f07367fbd893d6015a07554119dbe570a8b0a05fdc659c253.script [ctx] 10000]
