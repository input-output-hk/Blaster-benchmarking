import LiveScripts.Shared
import LiveScripts.S_be59f7750a5d947bb649e70d574d066791ec34a1dfee2a087c8511e3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_be59f7750a5d947bb649e70d574d066791ec34a1dfee2a087c8511e3.script [ctx] 10000]
