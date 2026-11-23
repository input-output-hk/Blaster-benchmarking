import LiveScripts.Shared
import LiveScripts.S_3870c0e0fc94adc0f008231b7071e7f10ce986ff3aab19a6a2f5a6b0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3870c0e0fc94adc0f008231b7071e7f10ce986ff3aab19a6a2f5a6b0.script [ctx] 10000]
