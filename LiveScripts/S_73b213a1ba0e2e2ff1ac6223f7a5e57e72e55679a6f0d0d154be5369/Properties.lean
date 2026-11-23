import LiveScripts.Shared
import LiveScripts.S_73b213a1ba0e2e2ff1ac6223f7a5e57e72e55679a6f0d0d154be5369.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_73b213a1ba0e2e2ff1ac6223f7a5e57e72e55679a6f0d0d154be5369.script [ctx] 10000]
