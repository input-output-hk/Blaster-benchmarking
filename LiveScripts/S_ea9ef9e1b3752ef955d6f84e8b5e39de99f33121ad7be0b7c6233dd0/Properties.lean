import LiveScripts.Shared
import LiveScripts.S_ea9ef9e1b3752ef955d6f84e8b5e39de99f33121ad7be0b7c6233dd0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ea9ef9e1b3752ef955d6f84e8b5e39de99f33121ad7be0b7c6233dd0.script [ctx] 10000]
