import LiveScripts.Shared
import LiveScripts.S_5b963d51803bc41d3ced07e268ffc379d92c239e3a8c25ee24af4cd2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5b963d51803bc41d3ced07e268ffc379d92c239e3a8c25ee24af4cd2.script [ctx] 10000]
