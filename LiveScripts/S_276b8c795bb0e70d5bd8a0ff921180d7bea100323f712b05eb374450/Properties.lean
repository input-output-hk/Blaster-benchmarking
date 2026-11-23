import LiveScripts.Shared
import LiveScripts.S_276b8c795bb0e70d5bd8a0ff921180d7bea100323f712b05eb374450.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_276b8c795bb0e70d5bd8a0ff921180d7bea100323f712b05eb374450.script [ctx] 10000]
