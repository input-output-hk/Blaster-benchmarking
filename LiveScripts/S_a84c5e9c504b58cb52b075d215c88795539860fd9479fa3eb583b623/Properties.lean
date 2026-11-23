import LiveScripts.Shared
import LiveScripts.S_a84c5e9c504b58cb52b075d215c88795539860fd9479fa3eb583b623.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a84c5e9c504b58cb52b075d215c88795539860fd9479fa3eb583b623.script [ctx] 10000]
