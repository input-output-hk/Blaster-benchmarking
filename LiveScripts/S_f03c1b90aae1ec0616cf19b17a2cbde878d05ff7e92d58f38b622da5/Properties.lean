import LiveScripts.Shared
import LiveScripts.S_f03c1b90aae1ec0616cf19b17a2cbde878d05ff7e92d58f38b622da5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f03c1b90aae1ec0616cf19b17a2cbde878d05ff7e92d58f38b622da5.script [ctx] 10000]
