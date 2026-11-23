import LiveScripts.Shared
import LiveScripts.S_13362216cb08c10be9aca0fb3f5b2927e7960b689746a0e70f592444.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_13362216cb08c10be9aca0fb3f5b2927e7960b689746a0e70f592444.script [redeemer, ctx] 10000]
