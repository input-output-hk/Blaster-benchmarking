import LiveScripts.Shared
import LiveScripts.S_ca751ac2696c1d4d2e4e24343d126150be9c68bad53be6a156328bdb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ca751ac2696c1d4d2e4e24343d126150be9c68bad53be6a156328bdb.script [datum, redeemer, ctx] 10000]
