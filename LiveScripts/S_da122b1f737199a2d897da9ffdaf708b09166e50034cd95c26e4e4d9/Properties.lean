import LiveScripts.Shared
import LiveScripts.S_da122b1f737199a2d897da9ffdaf708b09166e50034cd95c26e4e4d9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_da122b1f737199a2d897da9ffdaf708b09166e50034cd95c26e4e4d9.script [ctx] 10000]
