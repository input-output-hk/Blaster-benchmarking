import LiveScripts.Shared
import LiveScripts.S_f3ea7af6a0d5e7216793a674cd723e5274ee596cc87ba84aee844df1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f3ea7af6a0d5e7216793a674cd723e5274ee596cc87ba84aee844df1.script [ctx] 10000]
