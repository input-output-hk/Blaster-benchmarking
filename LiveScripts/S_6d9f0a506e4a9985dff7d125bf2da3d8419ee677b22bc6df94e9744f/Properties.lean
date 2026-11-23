import LiveScripts.Shared
import LiveScripts.S_6d9f0a506e4a9985dff7d125bf2da3d8419ee677b22bc6df94e9744f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6d9f0a506e4a9985dff7d125bf2da3d8419ee677b22bc6df94e9744f.script [ctx] 10000]
