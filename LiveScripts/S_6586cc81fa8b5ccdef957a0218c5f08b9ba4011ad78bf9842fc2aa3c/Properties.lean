import LiveScripts.Shared
import LiveScripts.S_6586cc81fa8b5ccdef957a0218c5f08b9ba4011ad78bf9842fc2aa3c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6586cc81fa8b5ccdef957a0218c5f08b9ba4011ad78bf9842fc2aa3c.script [datum, redeemer, ctx] 10000]
