import LiveScripts.Shared
import LiveScripts.S_5a84c39b7cea80398218b96c08e5200883e7eb3ff81c97345095d57b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5a84c39b7cea80398218b96c08e5200883e7eb3ff81c97345095d57b.script [ctx] 10000]
