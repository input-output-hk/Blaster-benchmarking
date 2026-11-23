import LiveScripts.Shared
import LiveScripts.S_f3975bf110c7fe17617a1defb16da0bacea2f0e5b69d12602eb47ecb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f3975bf110c7fe17617a1defb16da0bacea2f0e5b69d12602eb47ecb.script [datum, redeemer, ctx] 10000]
