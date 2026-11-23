import LiveScripts.Shared
import LiveScripts.S_efd47423a005961c4fb01816e77f072d817b3c0fe9c0a26d2a148bc7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_efd47423a005961c4fb01816e77f072d817b3c0fe9c0a26d2a148bc7.script [datum, redeemer, ctx] 10000]
