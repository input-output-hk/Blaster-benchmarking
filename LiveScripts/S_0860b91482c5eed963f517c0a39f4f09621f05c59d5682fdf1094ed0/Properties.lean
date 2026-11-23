import LiveScripts.Shared
import LiveScripts.S_0860b91482c5eed963f517c0a39f4f09621f05c59d5682fdf1094ed0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0860b91482c5eed963f517c0a39f4f09621f05c59d5682fdf1094ed0.script [ctx] 10000]
