import LiveScripts.Shared
import LiveScripts.S_3eca957ef02d32f3ae24fe7a8a0b210522de7abe32282203eb32fe0a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3eca957ef02d32f3ae24fe7a8a0b210522de7abe32282203eb32fe0a.script [datum, redeemer, ctx] 10000]
