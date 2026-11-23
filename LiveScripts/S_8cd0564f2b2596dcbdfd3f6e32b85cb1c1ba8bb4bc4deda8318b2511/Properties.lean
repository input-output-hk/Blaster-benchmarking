import LiveScripts.Shared
import LiveScripts.S_8cd0564f2b2596dcbdfd3f6e32b85cb1c1ba8bb4bc4deda8318b2511.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8cd0564f2b2596dcbdfd3f6e32b85cb1c1ba8bb4bc4deda8318b2511.script [ctx] 10000]
