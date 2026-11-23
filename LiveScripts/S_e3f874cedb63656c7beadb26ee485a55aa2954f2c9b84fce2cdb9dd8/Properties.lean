import LiveScripts.Shared
import LiveScripts.S_e3f874cedb63656c7beadb26ee485a55aa2954f2c9b84fce2cdb9dd8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e3f874cedb63656c7beadb26ee485a55aa2954f2c9b84fce2cdb9dd8.script [datum, redeemer, ctx] 10000]
