import LiveScripts.Shared
import LiveScripts.S_13d4e276416f5e876105ca7c48f75141103feb453da856c46b5e9d6e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_13d4e276416f5e876105ca7c48f75141103feb453da856c46b5e9d6e.script [ctx] 10000]
