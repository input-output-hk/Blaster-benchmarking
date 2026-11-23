import LiveScripts.Shared
import LiveScripts.S_c2df3dad523a9d981dc11ae6beb1ecc2174c07c1267bccf13a475bad.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c2df3dad523a9d981dc11ae6beb1ecc2174c07c1267bccf13a475bad.script [datum, redeemer, ctx] 10000]
