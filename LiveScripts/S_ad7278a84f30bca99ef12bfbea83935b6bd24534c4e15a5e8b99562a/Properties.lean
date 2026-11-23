import LiveScripts.Shared
import LiveScripts.S_ad7278a84f30bca99ef12bfbea83935b6bd24534c4e15a5e8b99562a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ad7278a84f30bca99ef12bfbea83935b6bd24534c4e15a5e8b99562a.script [datum, redeemer, ctx] 10000]
