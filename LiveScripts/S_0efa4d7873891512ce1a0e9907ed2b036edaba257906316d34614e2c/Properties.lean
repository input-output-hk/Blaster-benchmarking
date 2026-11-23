import LiveScripts.Shared
import LiveScripts.S_0efa4d7873891512ce1a0e9907ed2b036edaba257906316d34614e2c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0efa4d7873891512ce1a0e9907ed2b036edaba257906316d34614e2c.script [ctx] 10000]
