import LiveScripts.Shared
import LiveScripts.S_7da4b582f8747b43bf4d8d4f16eb52b44521dcd1f9ce198870946906.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7da4b582f8747b43bf4d8d4f16eb52b44521dcd1f9ce198870946906.script [ctx] 10000]
