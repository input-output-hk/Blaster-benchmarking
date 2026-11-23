import LiveScripts.Shared
import LiveScripts.S_713c5fd47f490ce4134cd4ca66ffba5369b997598359973b4f34400f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_713c5fd47f490ce4134cd4ca66ffba5369b997598359973b4f34400f.script [ctx] 10000]
