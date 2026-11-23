import LiveScripts.Shared
import LiveScripts.S_20e86086670e42bfb755288e8e568bfa9214ce2bc3e46958dd971355.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_20e86086670e42bfb755288e8e568bfa9214ce2bc3e46958dd971355.script [ctx] 10000]
