import LiveScripts.Shared
import LiveScripts.S_271b7b9d7317a209265d37d9d8ccdb09970f0124500c033513a2dfde.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_271b7b9d7317a209265d37d9d8ccdb09970f0124500c033513a2dfde.script [datum, redeemer, ctx] 10000]
