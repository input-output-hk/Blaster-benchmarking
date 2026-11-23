import LiveScripts.Shared
import LiveScripts.S_b09a7e098bc3fe0435615fde39c893c20957d167ec0722712fa36235.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b09a7e098bc3fe0435615fde39c893c20957d167ec0722712fa36235.script [ctx] 10000]
