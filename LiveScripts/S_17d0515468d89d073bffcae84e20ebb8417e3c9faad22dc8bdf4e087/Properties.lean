import LiveScripts.Shared
import LiveScripts.S_17d0515468d89d073bffcae84e20ebb8417e3c9faad22dc8bdf4e087.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_17d0515468d89d073bffcae84e20ebb8417e3c9faad22dc8bdf4e087.script [ctx] 10000]
