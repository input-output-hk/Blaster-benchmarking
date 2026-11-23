import LiveScripts.Shared
import LiveScripts.S_3e6d4f833cc0ba014b22c47f2c84304c336d08cbe536c0060b249db0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3e6d4f833cc0ba014b22c47f2c84304c336d08cbe536c0060b249db0.script [ctx] 10000]
