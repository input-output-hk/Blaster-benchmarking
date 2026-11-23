import LiveScripts.Shared
import LiveScripts.S_54fb6950f13eb62328958edab4e0be779f99bd18eb52c44467c3c781.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_54fb6950f13eb62328958edab4e0be779f99bd18eb52c44467c3c781.script [datum, redeemer, ctx] 10000]
