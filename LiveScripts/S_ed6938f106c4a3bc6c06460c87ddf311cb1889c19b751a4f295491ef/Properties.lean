import LiveScripts.Shared
import LiveScripts.S_ed6938f106c4a3bc6c06460c87ddf311cb1889c19b751a4f295491ef.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ed6938f106c4a3bc6c06460c87ddf311cb1889c19b751a4f295491ef.script [datum, redeemer, ctx] 10000]
