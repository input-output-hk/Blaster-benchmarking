import LiveScripts.Shared
import LiveScripts.S_da9525463841173ad1230b1d5a1b5d0a3116bbdeb4412327148a1b7a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_da9525463841173ad1230b1d5a1b5d0a3116bbdeb4412327148a1b7a.script [datum, redeemer, ctx] 10000]
