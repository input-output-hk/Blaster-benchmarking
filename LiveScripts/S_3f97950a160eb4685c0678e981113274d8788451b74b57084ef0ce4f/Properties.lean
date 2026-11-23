import LiveScripts.Shared
import LiveScripts.S_3f97950a160eb4685c0678e981113274d8788451b74b57084ef0ce4f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3f97950a160eb4685c0678e981113274d8788451b74b57084ef0ce4f.script [ctx] 10000]
