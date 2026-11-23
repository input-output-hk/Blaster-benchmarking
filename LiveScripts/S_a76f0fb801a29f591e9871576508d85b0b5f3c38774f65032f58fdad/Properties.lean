import LiveScripts.Shared
import LiveScripts.S_a76f0fb801a29f591e9871576508d85b0b5f3c38774f65032f58fdad.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a76f0fb801a29f591e9871576508d85b0b5f3c38774f65032f58fdad.script [datum, redeemer, ctx] 10000]
