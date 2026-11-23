import LiveScripts.Shared
import LiveScripts.S_008ff313dad990356a9503d255192e07cf5260b439ebc32e0b5ea2c4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_008ff313dad990356a9503d255192e07cf5260b439ebc32e0b5ea2c4.script [ctx] 10000]
