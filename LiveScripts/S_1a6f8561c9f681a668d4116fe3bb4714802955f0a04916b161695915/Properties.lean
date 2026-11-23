import LiveScripts.Shared
import LiveScripts.S_1a6f8561c9f681a668d4116fe3bb4714802955f0a04916b161695915.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1a6f8561c9f681a668d4116fe3bb4714802955f0a04916b161695915.script [ctx] 10000]
