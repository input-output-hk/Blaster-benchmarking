import LiveScripts.Shared
import LiveScripts.S_4346c33b38b46f5b34b60b86bc9ba4ea55f392a3c4cc4cafd060c6ce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4346c33b38b46f5b34b60b86bc9ba4ea55f392a3c4cc4cafd060c6ce.script [ctx] 10000]
