import LiveScripts.Shared
import LiveScripts.S_ede19c15dc357cf666b766d3b55d49b1ebb7dd3a221ae8121238db22.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ede19c15dc357cf666b766d3b55d49b1ebb7dd3a221ae8121238db22.script [ctx] 10000]
