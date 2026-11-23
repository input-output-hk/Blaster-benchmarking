import LiveScripts.Shared
import LiveScripts.S_03ee9cf951e89fb82c47edbff562ee90be17de85b2c24b451c7e8e39.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_03ee9cf951e89fb82c47edbff562ee90be17de85b2c24b451c7e8e39.script [ctx] 10000]
