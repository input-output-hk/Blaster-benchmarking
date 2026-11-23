import LiveScripts.Shared
import LiveScripts.S_f619a5f6e6ba29348b8c2cd813caaf202195ab3d37036bbff24c4307.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f619a5f6e6ba29348b8c2cd813caaf202195ab3d37036bbff24c4307.script [ctx] 10000]
