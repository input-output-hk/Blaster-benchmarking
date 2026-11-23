import LiveScripts.Shared
import LiveScripts.S_b23d5f5dc71cb2994f390d3fdfc612d0401bc17384e6153165d6a5c7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b23d5f5dc71cb2994f390d3fdfc612d0401bc17384e6153165d6a5c7.script [ctx] 10000]
