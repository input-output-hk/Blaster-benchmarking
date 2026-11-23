import LiveScripts.Shared
import LiveScripts.S_63150645be5c607279583a4d2c3c16a35f8632a264b351d85e0a7f94.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_63150645be5c607279583a4d2c3c16a35f8632a264b351d85e0a7f94.script [ctx] 10000]
