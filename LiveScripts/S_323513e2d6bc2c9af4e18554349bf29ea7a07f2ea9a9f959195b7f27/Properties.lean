import LiveScripts.Shared
import LiveScripts.S_323513e2d6bc2c9af4e18554349bf29ea7a07f2ea9a9f959195b7f27.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_323513e2d6bc2c9af4e18554349bf29ea7a07f2ea9a9f959195b7f27.script [ctx] 10000]
