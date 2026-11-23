import LiveScripts.Shared
import LiveScripts.S_4cbc487bc711146f32b2cc5498ededd6353b9b74af301f669f1294cc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4cbc487bc711146f32b2cc5498ededd6353b9b74af301f669f1294cc.script [ctx] 10000]
