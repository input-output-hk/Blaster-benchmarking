import LiveScripts.Shared
import LiveScripts.S_96cfb318134576b3bad86f688bf40ecb60148ee5dd6a942932f60a8f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_96cfb318134576b3bad86f688bf40ecb60148ee5dd6a942932f60a8f.script [datum, redeemer, ctx] 10000]
