import LiveScripts.Shared
import LiveScripts.S_4e1a435f8d55f26068150579c18964e58078082b899e6bb560be7cd5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4e1a435f8d55f26068150579c18964e58078082b899e6bb560be7cd5.script [ctx] 10000]
