import LiveScripts.Shared
import LiveScripts.S_b6e24f8aa2f1b7537940252e34a243ff3f7c5ba2168126afe451a83a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b6e24f8aa2f1b7537940252e34a243ff3f7c5ba2168126afe451a83a.script [ctx] 10000]
