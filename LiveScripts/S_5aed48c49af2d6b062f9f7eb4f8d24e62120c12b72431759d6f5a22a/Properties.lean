import LiveScripts.Shared
import LiveScripts.S_5aed48c49af2d6b062f9f7eb4f8d24e62120c12b72431759d6f5a22a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5aed48c49af2d6b062f9f7eb4f8d24e62120c12b72431759d6f5a22a.script [ctx] 10000]
