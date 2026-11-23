import LiveScripts.Shared
import LiveScripts.S_cc91b4ef8a31d730462f07cb4b37a09f1baa19be8852053e24a63ea5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cc91b4ef8a31d730462f07cb4b37a09f1baa19be8852053e24a63ea5.script [ctx] 10000]
