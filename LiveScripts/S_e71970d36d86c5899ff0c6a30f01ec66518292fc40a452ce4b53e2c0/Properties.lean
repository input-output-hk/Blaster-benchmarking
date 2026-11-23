import LiveScripts.Shared
import LiveScripts.S_e71970d36d86c5899ff0c6a30f01ec66518292fc40a452ce4b53e2c0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e71970d36d86c5899ff0c6a30f01ec66518292fc40a452ce4b53e2c0.script [ctx] 10000]
