import LiveScripts.Shared
import LiveScripts.S_55126301921898feca9c79517d5464b7e52bc4a7e0e6110a46a27f08.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_55126301921898feca9c79517d5464b7e52bc4a7e0e6110a46a27f08.script [datum, redeemer, ctx] 10000]
