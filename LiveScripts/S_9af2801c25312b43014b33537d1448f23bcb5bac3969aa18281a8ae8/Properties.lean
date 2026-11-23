import LiveScripts.Shared
import LiveScripts.S_9af2801c25312b43014b33537d1448f23bcb5bac3969aa18281a8ae8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9af2801c25312b43014b33537d1448f23bcb5bac3969aa18281a8ae8.script [ctx] 10000]
