import LiveScripts.Shared
import LiveScripts.S_5a0103220a367738ba0b180a465fe08756490b921aab4e0a0b46b5aa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5a0103220a367738ba0b180a465fe08756490b921aab4e0a0b46b5aa.script [ctx] 10000]
