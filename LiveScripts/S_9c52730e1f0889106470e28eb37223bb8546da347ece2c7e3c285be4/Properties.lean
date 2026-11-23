import LiveScripts.Shared
import LiveScripts.S_9c52730e1f0889106470e28eb37223bb8546da347ece2c7e3c285be4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9c52730e1f0889106470e28eb37223bb8546da347ece2c7e3c285be4.script [ctx] 10000]
