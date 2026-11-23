import LiveScripts.Shared
import LiveScripts.S_fb60b396a296fefc41603432bcfd53c028b695017edb54ee59674df1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fb60b396a296fefc41603432bcfd53c028b695017edb54ee59674df1.script [ctx] 10000]
