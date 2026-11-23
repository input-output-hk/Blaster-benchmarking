import LiveScripts.Shared
import LiveScripts.S_6cbe83f55737c61f654d5e8f7a0c04fb6e208e76aaa0a7dc4519d36e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6cbe83f55737c61f654d5e8f7a0c04fb6e208e76aaa0a7dc4519d36e.script [redeemer, ctx] 10000]
