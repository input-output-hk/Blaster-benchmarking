import LiveScripts.Shared
import LiveScripts.S_bdd749ab6415eb2917024e45ba0ebb54688dbe3dbe32f3e4b7719611.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bdd749ab6415eb2917024e45ba0ebb54688dbe3dbe32f3e4b7719611.script [ctx] 10000]
