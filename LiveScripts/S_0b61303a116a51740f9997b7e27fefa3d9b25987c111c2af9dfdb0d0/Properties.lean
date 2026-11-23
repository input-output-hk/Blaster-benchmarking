import LiveScripts.Shared
import LiveScripts.S_0b61303a116a51740f9997b7e27fefa3d9b25987c111c2af9dfdb0d0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0b61303a116a51740f9997b7e27fefa3d9b25987c111c2af9dfdb0d0.script [ctx] 10000]
