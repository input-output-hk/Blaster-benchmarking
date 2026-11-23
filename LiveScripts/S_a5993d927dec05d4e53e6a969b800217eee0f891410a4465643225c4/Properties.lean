import LiveScripts.Shared
import LiveScripts.S_a5993d927dec05d4e53e6a969b800217eee0f891410a4465643225c4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a5993d927dec05d4e53e6a969b800217eee0f891410a4465643225c4.script [ctx] 10000]
