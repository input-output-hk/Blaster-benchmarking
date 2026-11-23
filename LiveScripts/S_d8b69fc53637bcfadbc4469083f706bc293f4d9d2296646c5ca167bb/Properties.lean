import LiveScripts.Shared
import LiveScripts.S_d8b69fc53637bcfadbc4469083f706bc293f4d9d2296646c5ca167bb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d8b69fc53637bcfadbc4469083f706bc293f4d9d2296646c5ca167bb.script [ctx] 10000]
