import LiveScripts.Shared
import LiveScripts.S_5a99412330f2a1e0e320ee2b03e5eef3365f9e4d895c762902c2d957.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5a99412330f2a1e0e320ee2b03e5eef3365f9e4d895c762902c2d957.script [ctx] 10000]
