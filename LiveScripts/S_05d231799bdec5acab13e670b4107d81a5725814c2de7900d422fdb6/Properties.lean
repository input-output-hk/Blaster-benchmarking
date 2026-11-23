import LiveScripts.Shared
import LiveScripts.S_05d231799bdec5acab13e670b4107d81a5725814c2de7900d422fdb6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_05d231799bdec5acab13e670b4107d81a5725814c2de7900d422fdb6.script [ctx] 10000]
