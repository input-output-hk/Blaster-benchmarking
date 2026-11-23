import LiveScripts.Shared
import LiveScripts.S_5fb5d9c91a3f12135c94225adc11eb681be0f05f20ab42b51e3c2848.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5fb5d9c91a3f12135c94225adc11eb681be0f05f20ab42b51e3c2848.script [ctx] 10000]
