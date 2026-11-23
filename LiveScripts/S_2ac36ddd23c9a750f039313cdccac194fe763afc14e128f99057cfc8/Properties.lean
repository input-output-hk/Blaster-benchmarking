import LiveScripts.Shared
import LiveScripts.S_2ac36ddd23c9a750f039313cdccac194fe763afc14e128f99057cfc8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2ac36ddd23c9a750f039313cdccac194fe763afc14e128f99057cfc8.script [ctx] 10000]
