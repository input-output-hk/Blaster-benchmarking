import LiveScripts.Shared
import LiveScripts.S_87ac606a6f03f0423dfb634640d1bab9c85f5c5f1ee282f5e1afd7ce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_87ac606a6f03f0423dfb634640d1bab9c85f5c5f1ee282f5e1afd7ce.script [ctx] 10000]
