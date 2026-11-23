import LiveScripts.Shared
import LiveScripts.S_d7f2814781ac6b0adae1645f11f574232cc4acc83a2523a72e0e3ecd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d7f2814781ac6b0adae1645f11f574232cc4acc83a2523a72e0e3ecd.script [ctx] 10000]
