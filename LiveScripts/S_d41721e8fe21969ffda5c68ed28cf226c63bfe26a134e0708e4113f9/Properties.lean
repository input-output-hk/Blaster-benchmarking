import LiveScripts.Shared
import LiveScripts.S_d41721e8fe21969ffda5c68ed28cf226c63bfe26a134e0708e4113f9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d41721e8fe21969ffda5c68ed28cf226c63bfe26a134e0708e4113f9.script [ctx] 10000]
