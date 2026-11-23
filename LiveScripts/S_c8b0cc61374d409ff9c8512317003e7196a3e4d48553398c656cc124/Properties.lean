import LiveScripts.Shared
import LiveScripts.S_c8b0cc61374d409ff9c8512317003e7196a3e4d48553398c656cc124.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c8b0cc61374d409ff9c8512317003e7196a3e4d48553398c656cc124.script [redeemer, ctx] 10000]
