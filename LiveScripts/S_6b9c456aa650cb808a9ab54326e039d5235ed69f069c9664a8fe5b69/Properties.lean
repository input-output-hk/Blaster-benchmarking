import LiveScripts.Shared
import LiveScripts.S_6b9c456aa650cb808a9ab54326e039d5235ed69f069c9664a8fe5b69.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6b9c456aa650cb808a9ab54326e039d5235ed69f069c9664a8fe5b69.script [datum, redeemer, ctx] 10000]
