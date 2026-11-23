import LiveScripts.Shared
import LiveScripts.S_998b733ed03b0d745e1ef1330c33b9da3d3eeb119500b71fa155e298.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_998b733ed03b0d745e1ef1330c33b9da3d3eeb119500b71fa155e298.script [ctx] 10000]
