import LiveScripts.Shared
import LiveScripts.S_8ab4365e477bb39bb14424ef7df4b7abcdef1814e22fa90918fcc6cc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8ab4365e477bb39bb14424ef7df4b7abcdef1814e22fa90918fcc6cc.script [ctx] 10000]
