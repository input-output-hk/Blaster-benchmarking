import LiveScripts.Shared
import LiveScripts.S_5f976ad5acfe4e6e8b4f6341b9c93b5c9da3efd01da6cd67a30922b0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5f976ad5acfe4e6e8b4f6341b9c93b5c9da3efd01da6cd67a30922b0.script [ctx] 10000]
