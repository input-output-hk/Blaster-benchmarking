import LiveScripts.Shared
import LiveScripts.S_dd5568c889f41ba1509f31fc20c8745f3c7c8a179040c8eb2191cf09.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dd5568c889f41ba1509f31fc20c8745f3c7c8a179040c8eb2191cf09.script [ctx] 10000]
