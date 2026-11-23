import LiveScripts.Shared
import LiveScripts.S_8cd62e5a2553c5d57be78ba0058451b925b4f1d111a2f6fd5c73a94b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8cd62e5a2553c5d57be78ba0058451b925b4f1d111a2f6fd5c73a94b.script [datum, redeemer, ctx] 10000]
