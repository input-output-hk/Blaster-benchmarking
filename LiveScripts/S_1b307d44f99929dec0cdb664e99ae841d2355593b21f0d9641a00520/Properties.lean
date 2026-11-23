import LiveScripts.Shared
import LiveScripts.S_1b307d44f99929dec0cdb664e99ae841d2355593b21f0d9641a00520.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1b307d44f99929dec0cdb664e99ae841d2355593b21f0d9641a00520.script [datum, redeemer, ctx] 10000]
