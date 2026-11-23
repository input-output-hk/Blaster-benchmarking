import LiveScripts.Shared
import LiveScripts.S_5cbed363f7892175037d67927dc44a22dec85e0135175e4cbe10c90f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5cbed363f7892175037d67927dc44a22dec85e0135175e4cbe10c90f.script [ctx] 10000]
