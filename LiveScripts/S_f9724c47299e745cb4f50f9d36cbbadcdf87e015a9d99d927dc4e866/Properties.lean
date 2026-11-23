import LiveScripts.Shared
import LiveScripts.S_f9724c47299e745cb4f50f9d36cbbadcdf87e015a9d99d927dc4e866.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f9724c47299e745cb4f50f9d36cbbadcdf87e015a9d99d927dc4e866.script [ctx] 10000]
