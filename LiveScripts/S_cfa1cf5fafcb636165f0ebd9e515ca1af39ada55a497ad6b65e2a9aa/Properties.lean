import LiveScripts.Shared
import LiveScripts.S_cfa1cf5fafcb636165f0ebd9e515ca1af39ada55a497ad6b65e2a9aa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cfa1cf5fafcb636165f0ebd9e515ca1af39ada55a497ad6b65e2a9aa.script [ctx] 10000]
