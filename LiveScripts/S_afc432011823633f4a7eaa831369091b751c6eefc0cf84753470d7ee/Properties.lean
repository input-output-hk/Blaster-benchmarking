import LiveScripts.Shared
import LiveScripts.S_afc432011823633f4a7eaa831369091b751c6eefc0cf84753470d7ee.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_afc432011823633f4a7eaa831369091b751c6eefc0cf84753470d7ee.script [ctx] 10000]
