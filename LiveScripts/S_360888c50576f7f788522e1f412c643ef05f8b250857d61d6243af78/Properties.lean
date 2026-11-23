import LiveScripts.Shared
import LiveScripts.S_360888c50576f7f788522e1f412c643ef05f8b250857d61d6243af78.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_360888c50576f7f788522e1f412c643ef05f8b250857d61d6243af78.script [ctx] 10000]
