import LiveScripts.Shared
import LiveScripts.S_780a5123dd4a88b457a0752cc6a91838b277d2a962f80c949adb58dd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_780a5123dd4a88b457a0752cc6a91838b277d2a962f80c949adb58dd.script [ctx] 10000]
