import LiveScripts.Shared
import LiveScripts.S_88ea9e7c2fde775a90406dd324f6b99e980250809fc223d88c64553e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_88ea9e7c2fde775a90406dd324f6b99e980250809fc223d88c64553e.script [ctx] 10000]
