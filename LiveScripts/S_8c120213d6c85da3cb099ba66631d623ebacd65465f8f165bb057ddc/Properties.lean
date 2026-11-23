import LiveScripts.Shared
import LiveScripts.S_8c120213d6c85da3cb099ba66631d623ebacd65465f8f165bb057ddc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8c120213d6c85da3cb099ba66631d623ebacd65465f8f165bb057ddc.script [ctx] 10000]
