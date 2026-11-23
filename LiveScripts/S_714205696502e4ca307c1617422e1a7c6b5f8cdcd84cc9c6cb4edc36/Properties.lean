import LiveScripts.Shared
import LiveScripts.S_714205696502e4ca307c1617422e1a7c6b5f8cdcd84cc9c6cb4edc36.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_714205696502e4ca307c1617422e1a7c6b5f8cdcd84cc9c6cb4edc36.script [ctx] 10000]
