import LiveScripts.Shared
import LiveScripts.S_73d8a23a1e4faf8daa7c5d6b14ac340bab3e75eee2374d54b1c183d5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_73d8a23a1e4faf8daa7c5d6b14ac340bab3e75eee2374d54b1c183d5.script [ctx] 10000]
