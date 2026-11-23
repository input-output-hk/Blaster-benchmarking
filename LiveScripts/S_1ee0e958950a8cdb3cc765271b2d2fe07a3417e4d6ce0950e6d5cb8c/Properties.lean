import LiveScripts.Shared
import LiveScripts.S_1ee0e958950a8cdb3cc765271b2d2fe07a3417e4d6ce0950e6d5cb8c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1ee0e958950a8cdb3cc765271b2d2fe07a3417e4d6ce0950e6d5cb8c.script [ctx] 10000]
