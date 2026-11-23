import LiveScripts.Shared
import LiveScripts.S_beecb63699712f913602c6f79f1939c55123499c31b00059b4ffe564.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_beecb63699712f913602c6f79f1939c55123499c31b00059b4ffe564.script [ctx] 10000]
