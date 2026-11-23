import LiveScripts.Shared
import LiveScripts.S_94da125f1c5560777bdc1aa2e4ff141cf84e7c000f3e6787c7e7cb5d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_94da125f1c5560777bdc1aa2e4ff141cf84e7c000f3e6787c7e7cb5d.script [ctx] 10000]
