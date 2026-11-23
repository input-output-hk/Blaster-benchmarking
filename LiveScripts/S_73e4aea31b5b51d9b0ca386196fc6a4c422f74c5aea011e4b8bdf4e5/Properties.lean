import LiveScripts.Shared
import LiveScripts.S_73e4aea31b5b51d9b0ca386196fc6a4c422f74c5aea011e4b8bdf4e5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_73e4aea31b5b51d9b0ca386196fc6a4c422f74c5aea011e4b8bdf4e5.script [ctx] 10000]
