import LiveScripts.Shared
import LiveScripts.S_5145396c6f376e8e25f409744beac0fd44740023cd8a658c522fbc7c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5145396c6f376e8e25f409744beac0fd44740023cd8a658c522fbc7c.script [ctx] 10000]
