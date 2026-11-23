import LiveScripts.Shared
import LiveScripts.S_5ec0bf47958dfa60def3b4e96b89953fa51f99c288fcb61495f9b9c7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5ec0bf47958dfa60def3b4e96b89953fa51f99c288fcb61495f9b9c7.script [datum, redeemer, ctx] 10000]
