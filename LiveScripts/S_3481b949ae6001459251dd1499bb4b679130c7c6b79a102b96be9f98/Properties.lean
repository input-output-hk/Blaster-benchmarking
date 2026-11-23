import LiveScripts.Shared
import LiveScripts.S_3481b949ae6001459251dd1499bb4b679130c7c6b79a102b96be9f98.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3481b949ae6001459251dd1499bb4b679130c7c6b79a102b96be9f98.script [ctx] 10000]
