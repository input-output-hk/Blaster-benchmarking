import LiveScripts.Shared
import LiveScripts.S_c15010b2b6b1f4bfdd91475819429b171f10c81a6f5aa6e8e6294ae4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c15010b2b6b1f4bfdd91475819429b171f10c81a6f5aa6e8e6294ae4.script [redeemer, ctx] 10000]
