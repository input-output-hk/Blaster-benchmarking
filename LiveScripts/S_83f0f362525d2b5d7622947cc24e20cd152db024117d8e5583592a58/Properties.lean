import LiveScripts.Shared
import LiveScripts.S_83f0f362525d2b5d7622947cc24e20cd152db024117d8e5583592a58.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_83f0f362525d2b5d7622947cc24e20cd152db024117d8e5583592a58.script [ctx] 10000]
