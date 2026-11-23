import LiveScripts.Shared
import LiveScripts.S_333f787dacd3d3ef3a3dff4837b845395aa7a2a653095fb6840a4fe6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_333f787dacd3d3ef3a3dff4837b845395aa7a2a653095fb6840a4fe6.script [ctx] 10000]
