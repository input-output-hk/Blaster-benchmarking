import LiveScripts.Shared
import LiveScripts.S_c07cd596ae22adb7c79737d8f465372293b1a0c30fc30cb096648058.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c07cd596ae22adb7c79737d8f465372293b1a0c30fc30cb096648058.script [datum, redeemer, ctx] 10000]
