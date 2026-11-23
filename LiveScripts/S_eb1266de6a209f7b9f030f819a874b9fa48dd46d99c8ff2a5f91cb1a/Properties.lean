import LiveScripts.Shared
import LiveScripts.S_eb1266de6a209f7b9f030f819a874b9fa48dd46d99c8ff2a5f91cb1a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_eb1266de6a209f7b9f030f819a874b9fa48dd46d99c8ff2a5f91cb1a.script [ctx] 10000]
