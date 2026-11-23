import LiveScripts.Shared
import LiveScripts.S_31ce9ea50240c64fb431dfba4d44621048a0e75224f9ffcafcc73a4c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_31ce9ea50240c64fb431dfba4d44621048a0e75224f9ffcafcc73a4c.script [ctx] 10000]
