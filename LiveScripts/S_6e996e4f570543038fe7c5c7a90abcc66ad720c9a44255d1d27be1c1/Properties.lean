import LiveScripts.Shared
import LiveScripts.S_6e996e4f570543038fe7c5c7a90abcc66ad720c9a44255d1d27be1c1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6e996e4f570543038fe7c5c7a90abcc66ad720c9a44255d1d27be1c1.script [ctx] 10000]
