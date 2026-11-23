import LiveScripts.Shared
import LiveScripts.S_8996bb07509defe0be6f0c39845a736b266c85a70d87ebfb66454a78.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8996bb07509defe0be6f0c39845a736b266c85a70d87ebfb66454a78.script [redeemer, ctx] 10000]
