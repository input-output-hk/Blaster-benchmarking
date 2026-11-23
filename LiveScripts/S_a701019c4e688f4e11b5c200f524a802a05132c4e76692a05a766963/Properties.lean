import LiveScripts.Shared
import LiveScripts.S_a701019c4e688f4e11b5c200f524a802a05132c4e76692a05a766963.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a701019c4e688f4e11b5c200f524a802a05132c4e76692a05a766963.script [ctx] 10000]
