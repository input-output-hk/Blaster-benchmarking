import LiveScripts.Shared
import LiveScripts.S_d77c0bea8bf5a2f8b3b401329ba22e77b2cd8fe88f2b8e2fc3781223.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d77c0bea8bf5a2f8b3b401329ba22e77b2cd8fe88f2b8e2fc3781223.script [ctx] 10000]
