import LiveScripts.Shared
import LiveScripts.S_62d3e3975c6ec02d4002640413368a2d46ea10548b1cd217a3e9b7cd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_62d3e3975c6ec02d4002640413368a2d46ea10548b1cd217a3e9b7cd.script [datum, redeemer, ctx] 10000]
