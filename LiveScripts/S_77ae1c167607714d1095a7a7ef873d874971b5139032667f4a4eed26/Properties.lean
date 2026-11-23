import LiveScripts.Shared
import LiveScripts.S_77ae1c167607714d1095a7a7ef873d874971b5139032667f4a4eed26.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_77ae1c167607714d1095a7a7ef873d874971b5139032667f4a4eed26.script [ctx] 10000]
