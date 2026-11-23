import LiveScripts.Shared
import LiveScripts.S_950be3650263b8233823f7684391293624c7ab8541dd0f5c5f3cf1ba.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_950be3650263b8233823f7684391293624c7ab8541dd0f5c5f3cf1ba.script [ctx] 10000]
