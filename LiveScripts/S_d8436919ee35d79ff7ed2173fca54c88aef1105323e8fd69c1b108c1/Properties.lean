import LiveScripts.Shared
import LiveScripts.S_d8436919ee35d79ff7ed2173fca54c88aef1105323e8fd69c1b108c1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d8436919ee35d79ff7ed2173fca54c88aef1105323e8fd69c1b108c1.script [ctx] 10000]
