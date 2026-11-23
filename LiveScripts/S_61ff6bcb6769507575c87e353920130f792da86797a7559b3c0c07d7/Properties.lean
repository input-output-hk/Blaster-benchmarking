import LiveScripts.Shared
import LiveScripts.S_61ff6bcb6769507575c87e353920130f792da86797a7559b3c0c07d7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_61ff6bcb6769507575c87e353920130f792da86797a7559b3c0c07d7.script [ctx] 10000]
