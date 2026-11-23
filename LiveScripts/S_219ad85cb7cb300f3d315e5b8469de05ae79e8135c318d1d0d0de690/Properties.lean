import LiveScripts.Shared
import LiveScripts.S_219ad85cb7cb300f3d315e5b8469de05ae79e8135c318d1d0d0de690.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_219ad85cb7cb300f3d315e5b8469de05ae79e8135c318d1d0d0de690.script [ctx] 10000]
