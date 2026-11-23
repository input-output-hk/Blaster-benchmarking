import LiveScripts.Shared
import LiveScripts.S_7e29ee999cb366a1f441373d2a1cce69e13c360d9f6e24c70b83c33c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7e29ee999cb366a1f441373d2a1cce69e13c360d9f6e24c70b83c33c.script [ctx] 10000]
