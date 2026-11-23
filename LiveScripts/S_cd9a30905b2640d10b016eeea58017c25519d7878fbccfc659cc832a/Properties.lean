import LiveScripts.Shared
import LiveScripts.S_cd9a30905b2640d10b016eeea58017c25519d7878fbccfc659cc832a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cd9a30905b2640d10b016eeea58017c25519d7878fbccfc659cc832a.script [ctx] 10000]
