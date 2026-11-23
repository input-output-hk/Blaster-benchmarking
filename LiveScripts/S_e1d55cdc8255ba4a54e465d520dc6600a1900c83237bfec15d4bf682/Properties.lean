import LiveScripts.Shared
import LiveScripts.S_e1d55cdc8255ba4a54e465d520dc6600a1900c83237bfec15d4bf682.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e1d55cdc8255ba4a54e465d520dc6600a1900c83237bfec15d4bf682.script [datum, redeemer, ctx] 10000]
