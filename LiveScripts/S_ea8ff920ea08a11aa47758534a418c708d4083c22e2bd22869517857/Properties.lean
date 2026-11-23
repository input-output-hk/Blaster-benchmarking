import LiveScripts.Shared
import LiveScripts.S_ea8ff920ea08a11aa47758534a418c708d4083c22e2bd22869517857.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ea8ff920ea08a11aa47758534a418c708d4083c22e2bd22869517857.script [ctx] 10000]
