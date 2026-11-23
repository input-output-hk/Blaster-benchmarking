import LiveScripts.Shared
import LiveScripts.S_6986bc530a176c89594d3973dade920e22e758c625c7e88bcfaa7f63.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6986bc530a176c89594d3973dade920e22e758c625c7e88bcfaa7f63.script [ctx] 10000]
