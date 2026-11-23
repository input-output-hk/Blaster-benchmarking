import LiveScripts.Shared
import LiveScripts.S_0d846d50e29c32b27107c4a54ff602d5ecfb4de28f68546a3165bebb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0d846d50e29c32b27107c4a54ff602d5ecfb4de28f68546a3165bebb.script [ctx] 10000]
