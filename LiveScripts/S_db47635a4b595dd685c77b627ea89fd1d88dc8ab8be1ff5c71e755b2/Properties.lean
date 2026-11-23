import LiveScripts.Shared
import LiveScripts.S_db47635a4b595dd685c77b627ea89fd1d88dc8ab8be1ff5c71e755b2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_db47635a4b595dd685c77b627ea89fd1d88dc8ab8be1ff5c71e755b2.script [datum, redeemer, ctx] 10000]
