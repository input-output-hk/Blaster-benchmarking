import LiveScripts.Shared
import LiveScripts.S_f0bdb73a9fe70b6c0781b7a7466274dce6d78c7bd3e8fcb4244935e2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f0bdb73a9fe70b6c0781b7a7466274dce6d78c7bd3e8fcb4244935e2.script [ctx] 10000]
