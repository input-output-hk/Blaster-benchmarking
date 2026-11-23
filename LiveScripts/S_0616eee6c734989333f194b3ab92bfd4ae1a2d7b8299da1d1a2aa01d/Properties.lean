import LiveScripts.Shared
import LiveScripts.S_0616eee6c734989333f194b3ab92bfd4ae1a2d7b8299da1d1a2aa01d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0616eee6c734989333f194b3ab92bfd4ae1a2d7b8299da1d1a2aa01d.script [datum, redeemer, ctx] 10000]
