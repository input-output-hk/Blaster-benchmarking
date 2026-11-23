import LiveScripts.Shared
import LiveScripts.S_93b7986a1177af632f445b514447c46fb660e25426bdf8335642cf97.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_93b7986a1177af632f445b514447c46fb660e25426bdf8335642cf97.script [ctx] 10000]
