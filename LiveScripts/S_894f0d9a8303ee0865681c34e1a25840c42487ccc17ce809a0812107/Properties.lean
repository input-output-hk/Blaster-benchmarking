import LiveScripts.Shared
import LiveScripts.S_894f0d9a8303ee0865681c34e1a25840c42487ccc17ce809a0812107.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_894f0d9a8303ee0865681c34e1a25840c42487ccc17ce809a0812107.script [ctx] 10000]
