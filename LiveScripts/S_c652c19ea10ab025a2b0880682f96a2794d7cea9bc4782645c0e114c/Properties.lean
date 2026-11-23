import LiveScripts.Shared
import LiveScripts.S_c652c19ea10ab025a2b0880682f96a2794d7cea9bc4782645c0e114c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c652c19ea10ab025a2b0880682f96a2794d7cea9bc4782645c0e114c.script [datum, redeemer, ctx] 10000]
