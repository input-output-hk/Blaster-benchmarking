import LiveScripts.Shared
import LiveScripts.S_2ebc898f717d90206abe59b91c5e54fbae8744e16d4abe5a521f8588.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2ebc898f717d90206abe59b91c5e54fbae8744e16d4abe5a521f8588.script [datum, redeemer, ctx] 10000]
