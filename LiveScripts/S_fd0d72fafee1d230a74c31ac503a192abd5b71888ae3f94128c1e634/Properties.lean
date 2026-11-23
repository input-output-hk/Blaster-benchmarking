import LiveScripts.Shared
import LiveScripts.S_fd0d72fafee1d230a74c31ac503a192abd5b71888ae3f94128c1e634.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fd0d72fafee1d230a74c31ac503a192abd5b71888ae3f94128c1e634.script [redeemer, ctx] 10000]
