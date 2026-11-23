import LiveScripts.Shared
import LiveScripts.S_790a3847d440d274ef7e5de79603ebee9a9d3ce08b1624036c2764e3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_790a3847d440d274ef7e5de79603ebee9a9d3ce08b1624036c2764e3.script [ctx] 10000]
