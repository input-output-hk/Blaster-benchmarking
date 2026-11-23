import LiveScripts.Shared
import LiveScripts.S_09abe97f3d1c4615dbc3d71d42cee776ebd0e9fdc778d66684f1243f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_09abe97f3d1c4615dbc3d71d42cee776ebd0e9fdc778d66684f1243f.script [ctx] 10000]
