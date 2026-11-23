import LiveScripts.Shared
import LiveScripts.S_3a4b282e47c2e172960362c0dff397b189c9a4ca28f64cfac80015d9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3a4b282e47c2e172960362c0dff397b189c9a4ca28f64cfac80015d9.script [ctx] 10000]
