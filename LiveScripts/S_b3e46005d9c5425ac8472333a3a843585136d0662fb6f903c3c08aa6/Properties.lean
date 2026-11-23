import LiveScripts.Shared
import LiveScripts.S_b3e46005d9c5425ac8472333a3a843585136d0662fb6f903c3c08aa6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b3e46005d9c5425ac8472333a3a843585136d0662fb6f903c3c08aa6.script [ctx] 10000]
