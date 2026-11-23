import LiveScripts.Shared
import LiveScripts.S_316a4969e413625f7b1949ebb2d3364cd068c8a4b3f7fbca9e2ff4c2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_316a4969e413625f7b1949ebb2d3364cd068c8a4b3f7fbca9e2ff4c2.script [ctx] 10000]
