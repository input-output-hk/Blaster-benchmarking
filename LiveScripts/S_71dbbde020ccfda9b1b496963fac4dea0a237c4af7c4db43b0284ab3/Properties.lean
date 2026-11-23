import LiveScripts.Shared
import LiveScripts.S_71dbbde020ccfda9b1b496963fac4dea0a237c4af7c4db43b0284ab3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_71dbbde020ccfda9b1b496963fac4dea0a237c4af7c4db43b0284ab3.script [datum, redeemer, ctx] 10000]
