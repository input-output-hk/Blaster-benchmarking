import LiveScripts.Shared
import LiveScripts.S_833d11e51e1586923b6fca37bf19b7f1c7e2cc94aa467d7b8fbba0ac.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_833d11e51e1586923b6fca37bf19b7f1c7e2cc94aa467d7b8fbba0ac.script [ctx] 10000]
