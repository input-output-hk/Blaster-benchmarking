import LiveScripts.Shared
import LiveScripts.S_28c101d79ccb60ca90e8dfeea2f916d381df520b6ededc959a5530bb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_28c101d79ccb60ca90e8dfeea2f916d381df520b6ededc959a5530bb.script [datum, redeemer, ctx] 10000]
