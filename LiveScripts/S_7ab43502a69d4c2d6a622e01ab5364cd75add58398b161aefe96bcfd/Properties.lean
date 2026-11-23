import LiveScripts.Shared
import LiveScripts.S_7ab43502a69d4c2d6a622e01ab5364cd75add58398b161aefe96bcfd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7ab43502a69d4c2d6a622e01ab5364cd75add58398b161aefe96bcfd.script [ctx] 10000]
