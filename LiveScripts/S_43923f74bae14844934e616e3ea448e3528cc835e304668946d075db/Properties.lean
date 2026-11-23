import LiveScripts.Shared
import LiveScripts.S_43923f74bae14844934e616e3ea448e3528cc835e304668946d075db.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_43923f74bae14844934e616e3ea448e3528cc835e304668946d075db.script [datum, redeemer, ctx] 10000]
