import LiveScripts.Shared
import LiveScripts.S_ad507d82c1aeace66ab2dcdcefc005827bb18f73e3981c18cfb6c573.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ad507d82c1aeace66ab2dcdcefc005827bb18f73e3981c18cfb6c573.script [ctx] 10000]
