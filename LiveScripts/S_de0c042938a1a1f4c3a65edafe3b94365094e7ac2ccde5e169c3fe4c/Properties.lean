import LiveScripts.Shared
import LiveScripts.S_de0c042938a1a1f4c3a65edafe3b94365094e7ac2ccde5e169c3fe4c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_de0c042938a1a1f4c3a65edafe3b94365094e7ac2ccde5e169c3fe4c.script [ctx] 10000]
