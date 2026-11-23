import LiveScripts.Shared
import LiveScripts.S_fefbb3c68a89df0b54389dcf364e7f9fedb4e88f3699f0cff9da9bb1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fefbb3c68a89df0b54389dcf364e7f9fedb4e88f3699f0cff9da9bb1.script [ctx] 10000]
