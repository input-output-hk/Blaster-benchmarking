import LiveScripts.Shared
import LiveScripts.S_2cc2f7d32c9365d314327826dd81fffb8114ac53a0fd682d4e29c8ae.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2cc2f7d32c9365d314327826dd81fffb8114ac53a0fd682d4e29c8ae.script [ctx] 10000]
