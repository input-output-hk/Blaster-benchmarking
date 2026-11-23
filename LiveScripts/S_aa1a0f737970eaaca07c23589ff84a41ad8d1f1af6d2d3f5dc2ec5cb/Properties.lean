import LiveScripts.Shared
import LiveScripts.S_aa1a0f737970eaaca07c23589ff84a41ad8d1f1af6d2d3f5dc2ec5cb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_aa1a0f737970eaaca07c23589ff84a41ad8d1f1af6d2d3f5dc2ec5cb.script [ctx] 10000]
