import LiveScripts.Shared
import LiveScripts.S_22d3995bcbb0deae2b29ff4f3747d0ffcfca0361e1a813e33612c504.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_22d3995bcbb0deae2b29ff4f3747d0ffcfca0361e1a813e33612c504.script [ctx] 10000]
