import LiveScripts.Shared
import LiveScripts.S_aabe597d93e4c025f33b6f4ef46ecf42ae38f0696fb2e98a8c362252.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_aabe597d93e4c025f33b6f4ef46ecf42ae38f0696fb2e98a8c362252.script [ctx] 10000]
