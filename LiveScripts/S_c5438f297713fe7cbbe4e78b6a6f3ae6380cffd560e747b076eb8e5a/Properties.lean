import LiveScripts.Shared
import LiveScripts.S_c5438f297713fe7cbbe4e78b6a6f3ae6380cffd560e747b076eb8e5a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c5438f297713fe7cbbe4e78b6a6f3ae6380cffd560e747b076eb8e5a.script [ctx] 10000]
