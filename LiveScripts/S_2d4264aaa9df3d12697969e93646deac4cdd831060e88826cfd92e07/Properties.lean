import LiveScripts.Shared
import LiveScripts.S_2d4264aaa9df3d12697969e93646deac4cdd831060e88826cfd92e07.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2d4264aaa9df3d12697969e93646deac4cdd831060e88826cfd92e07.script [ctx] 10000]
