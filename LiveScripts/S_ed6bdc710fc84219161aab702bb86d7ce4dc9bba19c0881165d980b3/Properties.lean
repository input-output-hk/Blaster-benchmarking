import LiveScripts.Shared
import LiveScripts.S_ed6bdc710fc84219161aab702bb86d7ce4dc9bba19c0881165d980b3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ed6bdc710fc84219161aab702bb86d7ce4dc9bba19c0881165d980b3.script [ctx] 10000]
