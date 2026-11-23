import LiveScripts.Shared
import LiveScripts.S_e18468a37561a6fd96976b59d92bf683252d88f5f737ea2ba37360be.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e18468a37561a6fd96976b59d92bf683252d88f5f737ea2ba37360be.script [ctx] 10000]
