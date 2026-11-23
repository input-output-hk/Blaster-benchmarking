import LiveScripts.Shared
import LiveScripts.S_60292753082b503e93e79b738d3977168179bbba6ea8f4b580175464.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_60292753082b503e93e79b738d3977168179bbba6ea8f4b580175464.script [ctx] 10000]
