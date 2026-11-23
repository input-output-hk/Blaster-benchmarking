import LiveScripts.Shared
import LiveScripts.S_68a98674968b50678c94eb70cf2a10e6b6eaaf2776ca62821c65109b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_68a98674968b50678c94eb70cf2a10e6b6eaaf2776ca62821c65109b.script [ctx] 10000]
