import LiveScripts.Shared
import LiveScripts.S_bdad64d3ba809c7b9f015cd011a7de6c0d336d60e7f85985d3e415b5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bdad64d3ba809c7b9f015cd011a7de6c0d336d60e7f85985d3e415b5.script [ctx] 10000]
