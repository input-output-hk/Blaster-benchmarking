import LiveScripts.Shared
import LiveScripts.S_3d9d76c894b7e33373c668b2a10dea82fb5fa7cc63164d9505eea234.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3d9d76c894b7e33373c668b2a10dea82fb5fa7cc63164d9505eea234.script [ctx] 10000]
