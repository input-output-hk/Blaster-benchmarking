import LiveScripts.Shared
import LiveScripts.S_f60fd1e70f4b9dfc09cdde8d7f7f1277de2694c82a516d7d3cc9e03e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f60fd1e70f4b9dfc09cdde8d7f7f1277de2694c82a516d7d3cc9e03e.script [datum, redeemer, ctx] 10000]
