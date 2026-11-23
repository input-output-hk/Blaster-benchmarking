import LiveScripts.Shared
import LiveScripts.S_61a63046f6987454dbfd94777d1c593b587069c5922fdc962fd2a90c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_61a63046f6987454dbfd94777d1c593b587069c5922fdc962fd2a90c.script [ctx] 10000]
