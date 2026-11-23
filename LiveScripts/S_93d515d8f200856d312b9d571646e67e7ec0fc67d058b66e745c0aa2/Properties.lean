import LiveScripts.Shared
import LiveScripts.S_93d515d8f200856d312b9d571646e67e7ec0fc67d058b66e745c0aa2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_93d515d8f200856d312b9d571646e67e7ec0fc67d058b66e745c0aa2.script [ctx] 10000]
