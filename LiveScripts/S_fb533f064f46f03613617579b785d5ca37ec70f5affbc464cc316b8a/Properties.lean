import LiveScripts.Shared
import LiveScripts.S_fb533f064f46f03613617579b785d5ca37ec70f5affbc464cc316b8a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fb533f064f46f03613617579b785d5ca37ec70f5affbc464cc316b8a.script [ctx] 10000]
