import LiveScripts.Shared
import LiveScripts.S_5b2a641a9ea8d870c9f16f35eccc82f3aa348cea7359d8b61c2daa18.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5b2a641a9ea8d870c9f16f35eccc82f3aa348cea7359d8b61c2daa18.script [ctx] 10000]
