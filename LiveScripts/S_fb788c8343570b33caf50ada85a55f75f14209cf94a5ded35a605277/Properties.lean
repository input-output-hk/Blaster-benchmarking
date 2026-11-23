import LiveScripts.Shared
import LiveScripts.S_fb788c8343570b33caf50ada85a55f75f14209cf94a5ded35a605277.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fb788c8343570b33caf50ada85a55f75f14209cf94a5ded35a605277.script [ctx] 10000]
