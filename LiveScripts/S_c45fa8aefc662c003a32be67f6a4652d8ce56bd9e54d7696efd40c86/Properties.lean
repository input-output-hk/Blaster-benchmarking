import LiveScripts.Shared
import LiveScripts.S_c45fa8aefc662c003a32be67f6a4652d8ce56bd9e54d7696efd40c86.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c45fa8aefc662c003a32be67f6a4652d8ce56bd9e54d7696efd40c86.script [redeemer, ctx] 10000]
