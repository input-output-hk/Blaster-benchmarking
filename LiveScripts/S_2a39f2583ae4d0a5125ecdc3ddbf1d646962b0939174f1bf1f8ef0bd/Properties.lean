import LiveScripts.Shared
import LiveScripts.S_2a39f2583ae4d0a5125ecdc3ddbf1d646962b0939174f1bf1f8ef0bd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2a39f2583ae4d0a5125ecdc3ddbf1d646962b0939174f1bf1f8ef0bd.script [ctx] 10000]
