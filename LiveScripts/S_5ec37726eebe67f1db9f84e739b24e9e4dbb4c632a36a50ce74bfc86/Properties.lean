import LiveScripts.Shared
import LiveScripts.S_5ec37726eebe67f1db9f84e739b24e9e4dbb4c632a36a50ce74bfc86.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5ec37726eebe67f1db9f84e739b24e9e4dbb4c632a36a50ce74bfc86.script [redeemer, ctx] 10000]
