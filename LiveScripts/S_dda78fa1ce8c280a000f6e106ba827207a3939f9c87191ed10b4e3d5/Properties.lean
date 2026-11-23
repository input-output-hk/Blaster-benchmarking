import LiveScripts.Shared
import LiveScripts.S_dda78fa1ce8c280a000f6e106ba827207a3939f9c87191ed10b4e3d5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dda78fa1ce8c280a000f6e106ba827207a3939f9c87191ed10b4e3d5.script [ctx] 10000]
