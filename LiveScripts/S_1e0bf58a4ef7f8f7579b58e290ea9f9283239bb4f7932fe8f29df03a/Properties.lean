import LiveScripts.Shared
import LiveScripts.S_1e0bf58a4ef7f8f7579b58e290ea9f9283239bb4f7932fe8f29df03a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1e0bf58a4ef7f8f7579b58e290ea9f9283239bb4f7932fe8f29df03a.script [ctx] 10000]
