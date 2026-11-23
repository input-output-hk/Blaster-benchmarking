import LiveScripts.Shared
import LiveScripts.S_c19132a434f2272730e9867aa06353c838f10d63fd4790cec1b4182a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c19132a434f2272730e9867aa06353c838f10d63fd4790cec1b4182a.script [datum, redeemer, ctx] 10000]
