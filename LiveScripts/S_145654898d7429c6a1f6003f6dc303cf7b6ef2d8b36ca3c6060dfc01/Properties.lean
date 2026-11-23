import LiveScripts.Shared
import LiveScripts.S_145654898d7429c6a1f6003f6dc303cf7b6ef2d8b36ca3c6060dfc01.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_145654898d7429c6a1f6003f6dc303cf7b6ef2d8b36ca3c6060dfc01.script [redeemer, ctx] 10000]
