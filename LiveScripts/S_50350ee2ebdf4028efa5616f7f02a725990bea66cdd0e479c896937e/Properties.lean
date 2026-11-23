import LiveScripts.Shared
import LiveScripts.S_50350ee2ebdf4028efa5616f7f02a725990bea66cdd0e479c896937e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_50350ee2ebdf4028efa5616f7f02a725990bea66cdd0e479c896937e.script [datum, redeemer, ctx] 10000]
