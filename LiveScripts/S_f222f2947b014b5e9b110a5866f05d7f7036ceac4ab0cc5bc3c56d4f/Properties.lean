import LiveScripts.Shared
import LiveScripts.S_f222f2947b014b5e9b110a5866f05d7f7036ceac4ab0cc5bc3c56d4f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f222f2947b014b5e9b110a5866f05d7f7036ceac4ab0cc5bc3c56d4f.script [ctx] 10000]
