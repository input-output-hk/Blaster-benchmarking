import LiveScripts.Shared
import LiveScripts.S_9f2acca514a1283b14d6cb9132d1d66bc9001ed034a2485c458a531d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9f2acca514a1283b14d6cb9132d1d66bc9001ed034a2485c458a531d.script [ctx] 10000]
