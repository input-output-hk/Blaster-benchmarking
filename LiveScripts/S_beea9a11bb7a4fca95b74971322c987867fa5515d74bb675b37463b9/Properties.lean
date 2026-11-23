import LiveScripts.Shared
import LiveScripts.S_beea9a11bb7a4fca95b74971322c987867fa5515d74bb675b37463b9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_beea9a11bb7a4fca95b74971322c987867fa5515d74bb675b37463b9.script [redeemer, ctx] 10000]
