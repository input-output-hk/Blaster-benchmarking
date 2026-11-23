import LiveScripts.Shared
import LiveScripts.S_aa2a1452fd21b0eb6527c4dffe71eb4293f1bf521696cf238d6540c4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_aa2a1452fd21b0eb6527c4dffe71eb4293f1bf521696cf238d6540c4.script [datum, redeemer, ctx] 10000]
