import LiveScripts.Shared
import LiveScripts.S_374737cab31b0eaa892686a6530ff393f7088a1290c8a027ea7e3bce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_374737cab31b0eaa892686a6530ff393f7088a1290c8a027ea7e3bce.script [datum, redeemer, ctx] 10000]
