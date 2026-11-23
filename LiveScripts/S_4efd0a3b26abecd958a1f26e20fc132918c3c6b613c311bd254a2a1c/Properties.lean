import LiveScripts.Shared
import LiveScripts.S_4efd0a3b26abecd958a1f26e20fc132918c3c6b613c311bd254a2a1c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4efd0a3b26abecd958a1f26e20fc132918c3c6b613c311bd254a2a1c.script [ctx] 10000]
