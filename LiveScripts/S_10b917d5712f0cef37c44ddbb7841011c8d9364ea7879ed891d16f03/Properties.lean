import LiveScripts.Shared
import LiveScripts.S_10b917d5712f0cef37c44ddbb7841011c8d9364ea7879ed891d16f03.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_10b917d5712f0cef37c44ddbb7841011c8d9364ea7879ed891d16f03.script [ctx] 10000]
