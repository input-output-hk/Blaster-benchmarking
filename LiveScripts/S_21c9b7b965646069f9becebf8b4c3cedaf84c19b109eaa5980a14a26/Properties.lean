import LiveScripts.Shared
import LiveScripts.S_21c9b7b965646069f9becebf8b4c3cedaf84c19b109eaa5980a14a26.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_21c9b7b965646069f9becebf8b4c3cedaf84c19b109eaa5980a14a26.script [ctx] 10000]
