import LiveScripts.Shared
import LiveScripts.S_03b8c94b18e2691284be6b6b64bc633fe9159eef1b9099457bd4c761.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_03b8c94b18e2691284be6b6b64bc633fe9159eef1b9099457bd4c761.script [ctx] 10000]
