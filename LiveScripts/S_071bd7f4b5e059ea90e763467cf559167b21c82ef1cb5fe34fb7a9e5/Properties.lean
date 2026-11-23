import LiveScripts.Shared
import LiveScripts.S_071bd7f4b5e059ea90e763467cf559167b21c82ef1cb5fe34fb7a9e5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_071bd7f4b5e059ea90e763467cf559167b21c82ef1cb5fe34fb7a9e5.script [datum, redeemer, ctx] 10000]
