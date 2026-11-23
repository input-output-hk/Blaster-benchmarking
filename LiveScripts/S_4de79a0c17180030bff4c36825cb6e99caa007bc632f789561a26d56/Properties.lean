import LiveScripts.Shared
import LiveScripts.S_4de79a0c17180030bff4c36825cb6e99caa007bc632f789561a26d56.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4de79a0c17180030bff4c36825cb6e99caa007bc632f789561a26d56.script [ctx] 10000]
