import LiveScripts.Shared
import LiveScripts.S_10ca5d9aa05844980a87b06781f5b33c7f02dad2abe18b55124910de.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_10ca5d9aa05844980a87b06781f5b33c7f02dad2abe18b55124910de.script [ctx] 10000]
