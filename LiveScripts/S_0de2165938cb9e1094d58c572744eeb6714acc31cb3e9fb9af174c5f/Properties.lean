import LiveScripts.Shared
import LiveScripts.S_0de2165938cb9e1094d58c572744eeb6714acc31cb3e9fb9af174c5f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0de2165938cb9e1094d58c572744eeb6714acc31cb3e9fb9af174c5f.script [ctx] 10000]
