import LiveScripts.Shared
import LiveScripts.S_ab74925ceea09c8b43431efd80612f282ac849f2edd486d8ffc5c9cb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ab74925ceea09c8b43431efd80612f282ac849f2edd486d8ffc5c9cb.script [ctx] 10000]
