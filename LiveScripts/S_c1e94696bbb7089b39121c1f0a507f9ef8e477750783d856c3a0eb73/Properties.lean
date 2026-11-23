import LiveScripts.Shared
import LiveScripts.S_c1e94696bbb7089b39121c1f0a507f9ef8e477750783d856c3a0eb73.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c1e94696bbb7089b39121c1f0a507f9ef8e477750783d856c3a0eb73.script [ctx] 10000]
