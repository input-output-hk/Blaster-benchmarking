import LiveScripts.Shared
import LiveScripts.S_10663eae553e601598920a9f0dbd20124c018dc40cb321ef27b94076.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_10663eae553e601598920a9f0dbd20124c018dc40cb321ef27b94076.script [datum, redeemer, ctx] 10000]
