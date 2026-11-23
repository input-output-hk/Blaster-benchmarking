import LiveScripts.Shared
import LiveScripts.S_2b009859e9508af6820d387ca9e208674d54485794b298ee715411ec.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2b009859e9508af6820d387ca9e208674d54485794b298ee715411ec.script [datum, redeemer, ctx] 10000]
