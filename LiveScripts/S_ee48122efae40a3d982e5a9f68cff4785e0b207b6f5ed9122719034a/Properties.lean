import LiveScripts.Shared
import LiveScripts.S_ee48122efae40a3d982e5a9f68cff4785e0b207b6f5ed9122719034a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ee48122efae40a3d982e5a9f68cff4785e0b207b6f5ed9122719034a.script [ctx] 10000]
