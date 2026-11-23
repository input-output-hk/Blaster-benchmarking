import LiveScripts.Shared
import LiveScripts.S_0be5078592f6c1f42e38e4c7ae8d2027801aa94ac61da1e94cf118f2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0be5078592f6c1f42e38e4c7ae8d2027801aa94ac61da1e94cf118f2.script [ctx] 10000]
