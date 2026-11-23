import LiveScripts.Shared
import LiveScripts.S_c1dce1c93676255cc264c3847527f545636896ecacaad9c1e219f4b4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c1dce1c93676255cc264c3847527f545636896ecacaad9c1e219f4b4.script [ctx] 10000]
