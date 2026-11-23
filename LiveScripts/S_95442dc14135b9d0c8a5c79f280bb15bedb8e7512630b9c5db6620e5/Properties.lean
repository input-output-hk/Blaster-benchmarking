import LiveScripts.Shared
import LiveScripts.S_95442dc14135b9d0c8a5c79f280bb15bedb8e7512630b9c5db6620e5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_95442dc14135b9d0c8a5c79f280bb15bedb8e7512630b9c5db6620e5.script [ctx] 10000]
