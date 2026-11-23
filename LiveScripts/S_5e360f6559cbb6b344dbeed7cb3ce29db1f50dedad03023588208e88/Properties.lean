import LiveScripts.Shared
import LiveScripts.S_5e360f6559cbb6b344dbeed7cb3ce29db1f50dedad03023588208e88.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5e360f6559cbb6b344dbeed7cb3ce29db1f50dedad03023588208e88.script [ctx] 10000]
