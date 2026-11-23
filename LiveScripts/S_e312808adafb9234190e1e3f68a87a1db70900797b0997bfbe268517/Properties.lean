import LiveScripts.Shared
import LiveScripts.S_e312808adafb9234190e1e3f68a87a1db70900797b0997bfbe268517.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e312808adafb9234190e1e3f68a87a1db70900797b0997bfbe268517.script [ctx] 10000]
