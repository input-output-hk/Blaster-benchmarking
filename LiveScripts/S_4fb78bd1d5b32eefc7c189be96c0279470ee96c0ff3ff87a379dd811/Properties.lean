import LiveScripts.Shared
import LiveScripts.S_4fb78bd1d5b32eefc7c189be96c0279470ee96c0ff3ff87a379dd811.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4fb78bd1d5b32eefc7c189be96c0279470ee96c0ff3ff87a379dd811.script [ctx] 10000]
