import LiveScripts.Shared
import LiveScripts.S_fc25686ac5e94215c1b563574e77023b2d887e6a9110a1295221fd0b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fc25686ac5e94215c1b563574e77023b2d887e6a9110a1295221fd0b.script [ctx] 10000]
