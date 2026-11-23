import LiveScripts.Shared
import LiveScripts.S_5001ab1440a4e658332765dd72ef685efc27c72a80da7bf59f60dc6f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5001ab1440a4e658332765dd72ef685efc27c72a80da7bf59f60dc6f.script [ctx] 10000]
