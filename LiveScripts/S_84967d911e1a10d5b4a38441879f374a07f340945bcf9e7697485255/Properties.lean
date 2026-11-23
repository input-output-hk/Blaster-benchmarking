import LiveScripts.Shared
import LiveScripts.S_84967d911e1a10d5b4a38441879f374a07f340945bcf9e7697485255.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_84967d911e1a10d5b4a38441879f374a07f340945bcf9e7697485255.script [ctx] 10000]
