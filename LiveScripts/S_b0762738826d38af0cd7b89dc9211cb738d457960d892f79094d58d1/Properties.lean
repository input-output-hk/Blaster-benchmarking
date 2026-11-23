import LiveScripts.Shared
import LiveScripts.S_b0762738826d38af0cd7b89dc9211cb738d457960d892f79094d58d1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b0762738826d38af0cd7b89dc9211cb738d457960d892f79094d58d1.script [datum, redeemer, ctx] 10000]
