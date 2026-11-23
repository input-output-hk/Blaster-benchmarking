import LiveScripts.Shared
import LiveScripts.S_d73b965f57c102c59f2809bebb74987bc0dcd7b0d9b8a3a717950caa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d73b965f57c102c59f2809bebb74987bc0dcd7b0d9b8a3a717950caa.script [ctx] 10000]
