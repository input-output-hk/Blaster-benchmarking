import LiveScripts.Shared
import LiveScripts.S_e0302560ced2fdcbfcb2602697df970cd0d6a38f94b32703f51c312b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e0302560ced2fdcbfcb2602697df970cd0d6a38f94b32703f51c312b.script [datum, redeemer, ctx] 10000]
