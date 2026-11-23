import LiveScripts.Shared
import LiveScripts.S_dcc6a744032782058554e242b23dc9d66ac287bf351d122aa8d8bd1f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dcc6a744032782058554e242b23dc9d66ac287bf351d122aa8d8bd1f.script [ctx] 10000]
