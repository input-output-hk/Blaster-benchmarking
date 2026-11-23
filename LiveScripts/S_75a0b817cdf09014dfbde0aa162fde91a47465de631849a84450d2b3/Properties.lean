import LiveScripts.Shared
import LiveScripts.S_75a0b817cdf09014dfbde0aa162fde91a47465de631849a84450d2b3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_75a0b817cdf09014dfbde0aa162fde91a47465de631849a84450d2b3.script [ctx] 10000]
