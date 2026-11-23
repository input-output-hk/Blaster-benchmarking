import LiveScripts.Shared
import LiveScripts.S_f806ff3aeacf5c969a1466e58fcc420306d726c9b0907e06f5f13679.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f806ff3aeacf5c969a1466e58fcc420306d726c9b0907e06f5f13679.script [ctx] 10000]
