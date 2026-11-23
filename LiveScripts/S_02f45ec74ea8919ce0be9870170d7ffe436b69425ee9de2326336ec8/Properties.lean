import LiveScripts.Shared
import LiveScripts.S_02f45ec74ea8919ce0be9870170d7ffe436b69425ee9de2326336ec8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_02f45ec74ea8919ce0be9870170d7ffe436b69425ee9de2326336ec8.script [ctx] 10000]
