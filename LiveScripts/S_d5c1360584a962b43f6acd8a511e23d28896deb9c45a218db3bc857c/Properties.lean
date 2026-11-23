import LiveScripts.Shared
import LiveScripts.S_d5c1360584a962b43f6acd8a511e23d28896deb9c45a218db3bc857c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d5c1360584a962b43f6acd8a511e23d28896deb9c45a218db3bc857c.script [ctx] 10000]
