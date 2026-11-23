import LiveScripts.Shared
import LiveScripts.S_c1e392ee7da9415f946de9d2aef9607322b47d6e84e8142ef0c340bf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c1e392ee7da9415f946de9d2aef9607322b47d6e84e8142ef0c340bf.script [ctx] 10000]
