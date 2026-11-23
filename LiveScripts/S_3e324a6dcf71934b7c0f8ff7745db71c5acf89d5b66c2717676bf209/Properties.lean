import LiveScripts.Shared
import LiveScripts.S_3e324a6dcf71934b7c0f8ff7745db71c5acf89d5b66c2717676bf209.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3e324a6dcf71934b7c0f8ff7745db71c5acf89d5b66c2717676bf209.script [ctx] 10000]
