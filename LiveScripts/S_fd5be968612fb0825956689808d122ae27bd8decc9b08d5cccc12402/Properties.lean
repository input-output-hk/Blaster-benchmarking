import LiveScripts.Shared
import LiveScripts.S_fd5be968612fb0825956689808d122ae27bd8decc9b08d5cccc12402.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fd5be968612fb0825956689808d122ae27bd8decc9b08d5cccc12402.script [ctx] 10000]
