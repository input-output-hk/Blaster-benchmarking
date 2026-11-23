import LiveScripts.Shared
import LiveScripts.S_6f46a396e68ef9f153d2ba55e6e921e54a339a1f1bb02b6e81169afb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6f46a396e68ef9f153d2ba55e6e921e54a339a1f1bb02b6e81169afb.script [ctx] 10000]
