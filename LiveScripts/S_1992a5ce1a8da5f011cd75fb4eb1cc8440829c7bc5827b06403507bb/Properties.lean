import LiveScripts.Shared
import LiveScripts.S_1992a5ce1a8da5f011cd75fb4eb1cc8440829c7bc5827b06403507bb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1992a5ce1a8da5f011cd75fb4eb1cc8440829c7bc5827b06403507bb.script [ctx] 10000]
