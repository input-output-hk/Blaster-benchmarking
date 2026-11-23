import LiveScripts.Shared
import LiveScripts.S_f8fe0d08c5f266f464254ee8d12fabec446fb71e19fdee5de30bd234.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f8fe0d08c5f266f464254ee8d12fabec446fb71e19fdee5de30bd234.script [ctx] 10000]
