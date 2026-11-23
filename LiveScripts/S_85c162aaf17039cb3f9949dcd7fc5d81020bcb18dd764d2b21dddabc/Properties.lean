import LiveScripts.Shared
import LiveScripts.S_85c162aaf17039cb3f9949dcd7fc5d81020bcb18dd764d2b21dddabc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_85c162aaf17039cb3f9949dcd7fc5d81020bcb18dd764d2b21dddabc.script [datum, redeemer, ctx] 10000]
