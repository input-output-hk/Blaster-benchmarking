import LiveScripts.Shared
import LiveScripts.S_4d48c3a1478a5b56ab57ec0dab6de0ad6957686f879ad668ccc2e82a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4d48c3a1478a5b56ab57ec0dab6de0ad6957686f879ad668ccc2e82a.script [ctx] 10000]
