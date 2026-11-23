import LiveScripts.Shared
import LiveScripts.S_960a4d8396286de6a5ef1c018229cf64c0f83003fa89247a3d8c0021.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_960a4d8396286de6a5ef1c018229cf64c0f83003fa89247a3d8c0021.script [ctx] 10000]
