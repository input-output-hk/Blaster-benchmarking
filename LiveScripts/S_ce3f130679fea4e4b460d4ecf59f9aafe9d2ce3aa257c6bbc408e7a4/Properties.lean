import LiveScripts.Shared
import LiveScripts.S_ce3f130679fea4e4b460d4ecf59f9aafe9d2ce3aa257c6bbc408e7a4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ce3f130679fea4e4b460d4ecf59f9aafe9d2ce3aa257c6bbc408e7a4.script [ctx] 10000]
