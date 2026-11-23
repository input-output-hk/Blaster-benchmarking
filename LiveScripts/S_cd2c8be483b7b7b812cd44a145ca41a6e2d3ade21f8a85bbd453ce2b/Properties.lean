import LiveScripts.Shared
import LiveScripts.S_cd2c8be483b7b7b812cd44a145ca41a6e2d3ade21f8a85bbd453ce2b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cd2c8be483b7b7b812cd44a145ca41a6e2d3ade21f8a85bbd453ce2b.script [ctx] 10000]
