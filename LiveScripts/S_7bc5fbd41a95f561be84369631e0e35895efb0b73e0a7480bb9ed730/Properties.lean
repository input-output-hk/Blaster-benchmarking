import LiveScripts.Shared
import LiveScripts.S_7bc5fbd41a95f561be84369631e0e35895efb0b73e0a7480bb9ed730.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7bc5fbd41a95f561be84369631e0e35895efb0b73e0a7480bb9ed730.script [datum, redeemer, ctx] 10000]
