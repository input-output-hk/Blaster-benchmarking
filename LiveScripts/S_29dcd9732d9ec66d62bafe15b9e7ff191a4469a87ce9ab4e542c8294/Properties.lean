import LiveScripts.Shared
import LiveScripts.S_29dcd9732d9ec66d62bafe15b9e7ff191a4469a87ce9ab4e542c8294.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_29dcd9732d9ec66d62bafe15b9e7ff191a4469a87ce9ab4e542c8294.script [ctx] 10000]
