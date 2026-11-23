import LiveScripts.Shared
import LiveScripts.S_1b4ee2e9583df78628bdbeac17244fa87c831862cba5bfa2d2ff7e69.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1b4ee2e9583df78628bdbeac17244fa87c831862cba5bfa2d2ff7e69.script [ctx] 10000]
