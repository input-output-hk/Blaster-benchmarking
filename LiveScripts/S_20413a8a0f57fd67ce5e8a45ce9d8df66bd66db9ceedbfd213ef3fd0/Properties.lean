import LiveScripts.Shared
import LiveScripts.S_20413a8a0f57fd67ce5e8a45ce9d8df66bd66db9ceedbfd213ef3fd0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_20413a8a0f57fd67ce5e8a45ce9d8df66bd66db9ceedbfd213ef3fd0.script [redeemer, ctx] 10000]
