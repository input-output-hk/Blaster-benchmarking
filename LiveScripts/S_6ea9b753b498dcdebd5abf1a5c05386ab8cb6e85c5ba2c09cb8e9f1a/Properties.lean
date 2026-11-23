import LiveScripts.Shared
import LiveScripts.S_6ea9b753b498dcdebd5abf1a5c05386ab8cb6e85c5ba2c09cb8e9f1a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6ea9b753b498dcdebd5abf1a5c05386ab8cb6e85c5ba2c09cb8e9f1a.script [ctx] 10000]
