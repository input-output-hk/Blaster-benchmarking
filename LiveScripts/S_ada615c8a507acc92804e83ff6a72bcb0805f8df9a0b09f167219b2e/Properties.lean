import LiveScripts.Shared
import LiveScripts.S_ada615c8a507acc92804e83ff6a72bcb0805f8df9a0b09f167219b2e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ada615c8a507acc92804e83ff6a72bcb0805f8df9a0b09f167219b2e.script [ctx] 10000]
