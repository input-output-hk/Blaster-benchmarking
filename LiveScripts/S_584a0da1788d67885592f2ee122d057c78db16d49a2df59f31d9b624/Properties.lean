import LiveScripts.Shared
import LiveScripts.S_584a0da1788d67885592f2ee122d057c78db16d49a2df59f31d9b624.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_584a0da1788d67885592f2ee122d057c78db16d49a2df59f31d9b624.script [ctx] 10000]
