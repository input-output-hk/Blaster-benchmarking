import LiveScripts.Shared
import LiveScripts.S_d8c774493134809582ea91d62e1d7a7f2dd67bc1744c243f881dce70.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d8c774493134809582ea91d62e1d7a7f2dd67bc1744c243f881dce70.script [ctx] 10000]
