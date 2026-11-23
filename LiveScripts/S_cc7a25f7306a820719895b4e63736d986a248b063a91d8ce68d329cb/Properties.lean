import LiveScripts.Shared
import LiveScripts.S_cc7a25f7306a820719895b4e63736d986a248b063a91d8ce68d329cb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cc7a25f7306a820719895b4e63736d986a248b063a91d8ce68d329cb.script [datum, redeemer, ctx] 10000]
