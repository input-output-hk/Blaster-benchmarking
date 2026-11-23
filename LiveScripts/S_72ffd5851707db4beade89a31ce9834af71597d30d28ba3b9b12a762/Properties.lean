import LiveScripts.Shared
import LiveScripts.S_72ffd5851707db4beade89a31ce9834af71597d30d28ba3b9b12a762.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_72ffd5851707db4beade89a31ce9834af71597d30d28ba3b9b12a762.script [ctx] 10000]
