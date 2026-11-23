import LiveScripts.Shared
import LiveScripts.S_f433618b5323fa6c76291630796baa9b792f02ed5eb71eb21818252f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f433618b5323fa6c76291630796baa9b792f02ed5eb71eb21818252f.script [datum, redeemer, ctx] 10000]
