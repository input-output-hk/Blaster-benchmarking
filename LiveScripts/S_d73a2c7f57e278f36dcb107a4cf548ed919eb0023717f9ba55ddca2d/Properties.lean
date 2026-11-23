import LiveScripts.Shared
import LiveScripts.S_d73a2c7f57e278f36dcb107a4cf548ed919eb0023717f9ba55ddca2d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d73a2c7f57e278f36dcb107a4cf548ed919eb0023717f9ba55ddca2d.script [datum, redeemer, ctx] 10000]
