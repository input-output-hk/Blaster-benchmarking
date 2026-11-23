import LiveScripts.Shared
import LiveScripts.S_3e6571393cf503a01558d3c82813ffebaf29249675aa448cdb5b6833.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3e6571393cf503a01558d3c82813ffebaf29249675aa448cdb5b6833.script [ctx] 10000]
