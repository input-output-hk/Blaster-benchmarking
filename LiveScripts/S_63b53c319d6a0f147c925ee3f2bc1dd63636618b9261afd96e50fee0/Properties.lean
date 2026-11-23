import LiveScripts.Shared
import LiveScripts.S_63b53c319d6a0f147c925ee3f2bc1dd63636618b9261afd96e50fee0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_63b53c319d6a0f147c925ee3f2bc1dd63636618b9261afd96e50fee0.script [ctx] 10000]
