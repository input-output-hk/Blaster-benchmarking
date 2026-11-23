import LiveScripts.Shared
import LiveScripts.S_e56466e7dc43618dfe6fdec9937b9cf2dcef34d54a3d8f0194a49c28.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e56466e7dc43618dfe6fdec9937b9cf2dcef34d54a3d8f0194a49c28.script [ctx] 10000]
