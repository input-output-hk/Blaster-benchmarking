import LiveScripts.Shared
import LiveScripts.S_6abf8f51138939741a4e219b4a7c569f56b79895e8eafb3e98717c4b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6abf8f51138939741a4e219b4a7c569f56b79895e8eafb3e98717c4b.script [redeemer, ctx] 10000]
