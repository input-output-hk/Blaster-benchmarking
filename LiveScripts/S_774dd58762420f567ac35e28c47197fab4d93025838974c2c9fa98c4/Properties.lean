import LiveScripts.Shared
import LiveScripts.S_774dd58762420f567ac35e28c47197fab4d93025838974c2c9fa98c4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_774dd58762420f567ac35e28c47197fab4d93025838974c2c9fa98c4.script [ctx] 10000]
