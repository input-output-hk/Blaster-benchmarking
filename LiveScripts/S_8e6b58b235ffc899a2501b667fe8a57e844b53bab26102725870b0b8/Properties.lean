import LiveScripts.Shared
import LiveScripts.S_8e6b58b235ffc899a2501b667fe8a57e844b53bab26102725870b0b8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8e6b58b235ffc899a2501b667fe8a57e844b53bab26102725870b0b8.script [ctx] 10000]
