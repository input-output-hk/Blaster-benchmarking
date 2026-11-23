import LiveScripts.Shared
import LiveScripts.S_b429738bd6cc58b5c7932d001aa2bd05cfea47020a556c8c753d4436.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b429738bd6cc58b5c7932d001aa2bd05cfea47020a556c8c753d4436.script [datum, redeemer, ctx] 10000]
