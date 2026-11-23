import LiveScripts.Shared
import LiveScripts.S_d42d10695c0c2f7b3f7e32a0559c80704da8cf320289e7831b99d825.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d42d10695c0c2f7b3f7e32a0559c80704da8cf320289e7831b99d825.script [datum, redeemer, ctx] 10000]
