import LiveScripts.Shared
import LiveScripts.S_fe12e62f3741edbff0218eb17c5318c68e099120f1e4a21c12ae6b79.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fe12e62f3741edbff0218eb17c5318c68e099120f1e4a21c12ae6b79.script [ctx] 10000]
