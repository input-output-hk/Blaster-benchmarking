import LiveScripts.Shared
import LiveScripts.S_47f0be2877ff65b94bfffa3db6fa62dbdf12df66474e1839ae866ddd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_47f0be2877ff65b94bfffa3db6fa62dbdf12df66474e1839ae866ddd.script [ctx] 10000]
