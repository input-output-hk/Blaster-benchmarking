import LiveScripts.Shared
import LiveScripts.S_8990cebdce2ee076195b2ab0204a5e7af34d468a7c51717321c15a57.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8990cebdce2ee076195b2ab0204a5e7af34d468a7c51717321c15a57.script [ctx] 10000]
