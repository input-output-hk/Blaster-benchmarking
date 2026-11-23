import LiveScripts.Shared
import LiveScripts.S_18ee1285f2eb6a43894b5f993c16b03061c703b2acc20d8aa3714092.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_18ee1285f2eb6a43894b5f993c16b03061c703b2acc20d8aa3714092.script [ctx] 10000]
