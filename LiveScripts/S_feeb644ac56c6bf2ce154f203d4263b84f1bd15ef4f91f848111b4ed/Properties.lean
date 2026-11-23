import LiveScripts.Shared
import LiveScripts.S_feeb644ac56c6bf2ce154f203d4263b84f1bd15ef4f91f848111b4ed.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_feeb644ac56c6bf2ce154f203d4263b84f1bd15ef4f91f848111b4ed.script [ctx] 10000]
