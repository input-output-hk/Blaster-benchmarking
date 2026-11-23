import LiveScripts.Shared
import LiveScripts.S_f60b7232837203d335cd77494d25c1cc0b218b9a8f3459730c521d13.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f60b7232837203d335cd77494d25c1cc0b218b9a8f3459730c521d13.script [redeemer, ctx] 10000]
