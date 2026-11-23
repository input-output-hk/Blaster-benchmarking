import LiveScripts.Shared
import LiveScripts.S_4e3e57c87e9103958bae11b29dcabd53cc991572b507c0766d2d622a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4e3e57c87e9103958bae11b29dcabd53cc991572b507c0766d2d622a.script [ctx] 10000]
