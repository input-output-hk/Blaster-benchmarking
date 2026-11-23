import LiveScripts.Shared
import LiveScripts.S_c030d7bb58a661dd82c30fa8af669c11e38fb009442f4acd2e0af178.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c030d7bb58a661dd82c30fa8af669c11e38fb009442f4acd2e0af178.script [ctx] 10000]
