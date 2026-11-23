import LiveScripts.Shared
import LiveScripts.S_89073c3a8511aa41cdc6ffabe7ff59d8cedab6177c621f0ed80e2155.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_89073c3a8511aa41cdc6ffabe7ff59d8cedab6177c621f0ed80e2155.script [datum, redeemer, ctx] 10000]
