import LiveScripts.Shared
import LiveScripts.S_6e552f710dbde573db5d3f4b2022b36ce2c74fed958d8bdf2bccf76e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6e552f710dbde573db5d3f4b2022b36ce2c74fed958d8bdf2bccf76e.script [datum, redeemer, ctx] 10000]
