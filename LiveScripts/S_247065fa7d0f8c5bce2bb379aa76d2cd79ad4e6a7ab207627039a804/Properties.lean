import LiveScripts.Shared
import LiveScripts.S_247065fa7d0f8c5bce2bb379aa76d2cd79ad4e6a7ab207627039a804.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_247065fa7d0f8c5bce2bb379aa76d2cd79ad4e6a7ab207627039a804.script [ctx] 10000]
