import LiveScripts.Shared
import LiveScripts.S_27c99684aa28cc6e189f5203473b2e9802841da159459e690234feb4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_27c99684aa28cc6e189f5203473b2e9802841da159459e690234feb4.script [ctx] 10000]
