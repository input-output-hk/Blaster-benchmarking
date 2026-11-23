import LiveScripts.Shared
import LiveScripts.S_32a7eadc6fa0023b4d639da63ba949b691d274c755c53618db2e0180.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_32a7eadc6fa0023b4d639da63ba949b691d274c755c53618db2e0180.script [redeemer, ctx] 10000]
