import LiveScripts.Shared
import LiveScripts.S_8afd64dd68f7b4140bae7a2ce0d59e58906602a2e936ba00ce060e9d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8afd64dd68f7b4140bae7a2ce0d59e58906602a2e936ba00ce060e9d.script [datum, redeemer, ctx] 10000]
