import LiveScripts.Shared
import LiveScripts.S_03f8f55723054788bd6c1d52aa002b1ae369abc0c93bd271b436a3f6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_03f8f55723054788bd6c1d52aa002b1ae369abc0c93bd271b436a3f6.script [ctx] 10000]
