import LiveScripts.Shared
import LiveScripts.S_0c4e125ec60e335a35278964cd71da667c76f907a8afdfef4b09482c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0c4e125ec60e335a35278964cd71da667c76f907a8afdfef4b09482c.script [datum, redeemer, ctx] 10000]
