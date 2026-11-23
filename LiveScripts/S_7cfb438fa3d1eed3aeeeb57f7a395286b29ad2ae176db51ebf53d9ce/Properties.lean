import LiveScripts.Shared
import LiveScripts.S_7cfb438fa3d1eed3aeeeb57f7a395286b29ad2ae176db51ebf53d9ce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7cfb438fa3d1eed3aeeeb57f7a395286b29ad2ae176db51ebf53d9ce.script [ctx] 10000]
