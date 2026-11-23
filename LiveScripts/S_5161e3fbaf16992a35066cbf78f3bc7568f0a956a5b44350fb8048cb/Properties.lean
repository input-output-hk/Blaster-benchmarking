import LiveScripts.Shared
import LiveScripts.S_5161e3fbaf16992a35066cbf78f3bc7568f0a956a5b44350fb8048cb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5161e3fbaf16992a35066cbf78f3bc7568f0a956a5b44350fb8048cb.script [ctx] 10000]
