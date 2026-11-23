import LiveScripts.Shared
import LiveScripts.S_ce9bc5e6847aabc3c1259043d2cafa03d1b925dae353c2362a5fbfda.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ce9bc5e6847aabc3c1259043d2cafa03d1b925dae353c2362a5fbfda.script [ctx] 10000]
