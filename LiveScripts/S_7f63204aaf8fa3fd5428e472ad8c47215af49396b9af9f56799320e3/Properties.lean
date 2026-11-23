import LiveScripts.Shared
import LiveScripts.S_7f63204aaf8fa3fd5428e472ad8c47215af49396b9af9f56799320e3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7f63204aaf8fa3fd5428e472ad8c47215af49396b9af9f56799320e3.script [ctx] 10000]
