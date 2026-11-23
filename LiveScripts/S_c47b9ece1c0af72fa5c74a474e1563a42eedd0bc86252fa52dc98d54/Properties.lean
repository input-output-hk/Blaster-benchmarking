import LiveScripts.Shared
import LiveScripts.S_c47b9ece1c0af72fa5c74a474e1563a42eedd0bc86252fa52dc98d54.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c47b9ece1c0af72fa5c74a474e1563a42eedd0bc86252fa52dc98d54.script [ctx] 10000]
