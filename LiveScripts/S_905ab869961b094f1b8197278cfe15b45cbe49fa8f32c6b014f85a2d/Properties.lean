import LiveScripts.Shared
import LiveScripts.S_905ab869961b094f1b8197278cfe15b45cbe49fa8f32c6b014f85a2d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_905ab869961b094f1b8197278cfe15b45cbe49fa8f32c6b014f85a2d.script [datum, redeemer, ctx] 10000]
