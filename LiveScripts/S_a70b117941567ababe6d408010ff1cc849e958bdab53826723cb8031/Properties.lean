import LiveScripts.Shared
import LiveScripts.S_a70b117941567ababe6d408010ff1cc849e958bdab53826723cb8031.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a70b117941567ababe6d408010ff1cc849e958bdab53826723cb8031.script [ctx] 10000]
