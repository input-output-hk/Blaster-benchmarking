import LiveScripts.Shared
import LiveScripts.S_38ffa7d7013f055aab8312fa04f254ddae77a5f8679f483ac9016b39.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_38ffa7d7013f055aab8312fa04f254ddae77a5f8679f483ac9016b39.script [ctx] 10000]
