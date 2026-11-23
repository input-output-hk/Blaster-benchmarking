import LiveScripts.Shared
import LiveScripts.S_19b9908183fc7180d82cb5e15bf9434f4eb644019b63dfd4ae4dbb0b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_19b9908183fc7180d82cb5e15bf9434f4eb644019b63dfd4ae4dbb0b.script [datum, redeemer, ctx] 10000]
