import LiveScripts.Shared
import LiveScripts.S_4499e188f12bce8a652d6bd7f012fe107be87211e74a0dfb0a3d90a0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4499e188f12bce8a652d6bd7f012fe107be87211e74a0dfb0a3d90a0.script [ctx] 10000]
