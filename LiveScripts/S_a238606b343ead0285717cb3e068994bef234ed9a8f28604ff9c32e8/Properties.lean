import LiveScripts.Shared
import LiveScripts.S_a238606b343ead0285717cb3e068994bef234ed9a8f28604ff9c32e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a238606b343ead0285717cb3e068994bef234ed9a8f28604ff9c32e8.script [redeemer, ctx] 10000]
