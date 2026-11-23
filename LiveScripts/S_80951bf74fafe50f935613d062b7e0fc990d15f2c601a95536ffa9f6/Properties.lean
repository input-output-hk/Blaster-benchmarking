import LiveScripts.Shared
import LiveScripts.S_80951bf74fafe50f935613d062b7e0fc990d15f2c601a95536ffa9f6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_80951bf74fafe50f935613d062b7e0fc990d15f2c601a95536ffa9f6.script [ctx] 10000]
