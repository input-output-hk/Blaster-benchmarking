import LiveScripts.Shared
import LiveScripts.S_c4f37d2bc1a955cfdc33597b3c089179ebeffdc624bbcf05b33950ef.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c4f37d2bc1a955cfdc33597b3c089179ebeffdc624bbcf05b33950ef.script [ctx] 10000]
