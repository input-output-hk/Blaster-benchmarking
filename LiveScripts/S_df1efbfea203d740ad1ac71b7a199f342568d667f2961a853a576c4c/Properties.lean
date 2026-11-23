import LiveScripts.Shared
import LiveScripts.S_df1efbfea203d740ad1ac71b7a199f342568d667f2961a853a576c4c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_df1efbfea203d740ad1ac71b7a199f342568d667f2961a853a576c4c.script [redeemer, ctx] 10000]
