import LiveScripts.Shared
import LiveScripts.S_c04be0225bbaf3d3722a6d1472244335c982b06c7f9bae3121ecb979.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c04be0225bbaf3d3722a6d1472244335c982b06c7f9bae3121ecb979.script [ctx] 10000]
