import LiveScripts.Shared
import LiveScripts.S_6c3c17048ed01498821b7854492c2608b2b86b31dcb5f5cf7a2967dc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6c3c17048ed01498821b7854492c2608b2b86b31dcb5f5cf7a2967dc.script [ctx] 10000]
