import LiveScripts.Shared
import LiveScripts.S_399e13b0b594a03b63be8e54c7216d0e2e38818e7bb669175aebd49f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_399e13b0b594a03b63be8e54c7216d0e2e38818e7bb669175aebd49f.script [datum, redeemer, ctx] 10000]
