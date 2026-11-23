import LiveScripts.Shared
import LiveScripts.S_613a2a36835b14c6c9a487faa85c4e9a91f6dc9690aba26058caa225.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_613a2a36835b14c6c9a487faa85c4e9a91f6dc9690aba26058caa225.script [ctx] 10000]
