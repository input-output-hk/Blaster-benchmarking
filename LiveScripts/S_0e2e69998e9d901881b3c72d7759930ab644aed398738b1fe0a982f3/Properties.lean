import LiveScripts.Shared
import LiveScripts.S_0e2e69998e9d901881b3c72d7759930ab644aed398738b1fe0a982f3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0e2e69998e9d901881b3c72d7759930ab644aed398738b1fe0a982f3.script [ctx] 10000]
