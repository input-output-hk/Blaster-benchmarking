import LiveScripts.Shared
import LiveScripts.S_a49e998d4f9519b70fdba54b3eaa76f2314f7fe98f74113c7c7c550c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a49e998d4f9519b70fdba54b3eaa76f2314f7fe98f74113c7c7c550c.script [ctx] 10000]
