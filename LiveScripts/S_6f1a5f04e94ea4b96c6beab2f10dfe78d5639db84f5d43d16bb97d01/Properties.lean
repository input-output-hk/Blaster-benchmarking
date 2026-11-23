import LiveScripts.Shared
import LiveScripts.S_6f1a5f04e94ea4b96c6beab2f10dfe78d5639db84f5d43d16bb97d01.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6f1a5f04e94ea4b96c6beab2f10dfe78d5639db84f5d43d16bb97d01.script [ctx] 10000]
