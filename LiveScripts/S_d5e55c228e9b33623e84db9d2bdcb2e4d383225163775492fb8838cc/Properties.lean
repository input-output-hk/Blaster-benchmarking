import LiveScripts.Shared
import LiveScripts.S_d5e55c228e9b33623e84db9d2bdcb2e4d383225163775492fb8838cc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d5e55c228e9b33623e84db9d2bdcb2e4d383225163775492fb8838cc.script [ctx] 10000]
