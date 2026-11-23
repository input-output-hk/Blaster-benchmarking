import LiveScripts.Shared
import LiveScripts.S_dc394bfa1110ae1df841b4d6a6668f1fe32f6f375a099f7be1cc8de5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dc394bfa1110ae1df841b4d6a6668f1fe32f6f375a099f7be1cc8de5.script [ctx] 10000]
