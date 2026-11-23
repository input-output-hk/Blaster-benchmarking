import LiveScripts.Shared
import LiveScripts.S_895701c19aa4d039387f88a6e638b8c2f8f7f6ade964a16f8b7cec39.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_895701c19aa4d039387f88a6e638b8c2f8f7f6ade964a16f8b7cec39.script [ctx] 10000]
