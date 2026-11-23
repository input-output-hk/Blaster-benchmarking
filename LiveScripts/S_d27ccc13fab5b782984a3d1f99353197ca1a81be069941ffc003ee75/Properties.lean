import LiveScripts.Shared
import LiveScripts.S_d27ccc13fab5b782984a3d1f99353197ca1a81be069941ffc003ee75.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d27ccc13fab5b782984a3d1f99353197ca1a81be069941ffc003ee75.script [ctx] 10000]
