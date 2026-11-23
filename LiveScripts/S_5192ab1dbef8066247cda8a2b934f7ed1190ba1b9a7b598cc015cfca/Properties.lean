import LiveScripts.Shared
import LiveScripts.S_5192ab1dbef8066247cda8a2b934f7ed1190ba1b9a7b598cc015cfca.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5192ab1dbef8066247cda8a2b934f7ed1190ba1b9a7b598cc015cfca.script [ctx] 10000]
