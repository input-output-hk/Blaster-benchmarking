import LiveScripts.Shared
import LiveScripts.S_3083d387537f9318b6ff5aeab7de5f5629d26495319b8fafd409222a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3083d387537f9318b6ff5aeab7de5f5629d26495319b8fafd409222a.script [ctx] 10000]
