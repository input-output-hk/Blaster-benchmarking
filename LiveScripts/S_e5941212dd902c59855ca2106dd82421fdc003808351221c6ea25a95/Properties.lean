import LiveScripts.Shared
import LiveScripts.S_e5941212dd902c59855ca2106dd82421fdc003808351221c6ea25a95.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e5941212dd902c59855ca2106dd82421fdc003808351221c6ea25a95.script [ctx] 10000]
