import LiveScripts.Shared
import LiveScripts.S_2d03841b26b843102d61e3e195e442d783ef8b182f6adc0e5064b796.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2d03841b26b843102d61e3e195e442d783ef8b182f6adc0e5064b796.script [ctx] 10000]
