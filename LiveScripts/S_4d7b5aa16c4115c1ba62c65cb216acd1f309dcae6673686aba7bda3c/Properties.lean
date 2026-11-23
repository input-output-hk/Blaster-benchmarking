import LiveScripts.Shared
import LiveScripts.S_4d7b5aa16c4115c1ba62c65cb216acd1f309dcae6673686aba7bda3c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4d7b5aa16c4115c1ba62c65cb216acd1f309dcae6673686aba7bda3c.script [ctx] 10000]
