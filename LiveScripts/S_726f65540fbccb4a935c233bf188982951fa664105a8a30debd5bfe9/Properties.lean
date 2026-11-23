import LiveScripts.Shared
import LiveScripts.S_726f65540fbccb4a935c233bf188982951fa664105a8a30debd5bfe9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_726f65540fbccb4a935c233bf188982951fa664105a8a30debd5bfe9.script [ctx] 10000]
