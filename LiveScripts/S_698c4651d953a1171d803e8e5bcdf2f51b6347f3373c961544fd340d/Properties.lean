import LiveScripts.Shared
import LiveScripts.S_698c4651d953a1171d803e8e5bcdf2f51b6347f3373c961544fd340d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_698c4651d953a1171d803e8e5bcdf2f51b6347f3373c961544fd340d.script [ctx] 10000]
