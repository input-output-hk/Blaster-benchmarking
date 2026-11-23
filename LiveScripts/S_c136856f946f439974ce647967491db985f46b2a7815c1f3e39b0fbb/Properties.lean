import LiveScripts.Shared
import LiveScripts.S_c136856f946f439974ce647967491db985f46b2a7815c1f3e39b0fbb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c136856f946f439974ce647967491db985f46b2a7815c1f3e39b0fbb.script [ctx] 10000]
