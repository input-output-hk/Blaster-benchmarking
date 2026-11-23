import LiveScripts.Shared
import LiveScripts.S_3b014432f045df1a2a68ccc4c4540809206a327ed9e69a4fe46d4475.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3b014432f045df1a2a68ccc4c4540809206a327ed9e69a4fe46d4475.script [datum, redeemer, ctx] 10000]
