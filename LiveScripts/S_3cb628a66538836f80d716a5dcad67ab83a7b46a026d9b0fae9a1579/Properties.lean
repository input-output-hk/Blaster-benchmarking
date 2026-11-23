import LiveScripts.Shared
import LiveScripts.S_3cb628a66538836f80d716a5dcad67ab83a7b46a026d9b0fae9a1579.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3cb628a66538836f80d716a5dcad67ab83a7b46a026d9b0fae9a1579.script [ctx] 10000]
