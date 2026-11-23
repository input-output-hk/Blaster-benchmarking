import LiveScripts.Shared
import LiveScripts.S_f1933896f08d1a3dc7d80e3a64ecc9ee088bd73e4ebd57b416b655ac.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f1933896f08d1a3dc7d80e3a64ecc9ee088bd73e4ebd57b416b655ac.script [ctx] 10000]
