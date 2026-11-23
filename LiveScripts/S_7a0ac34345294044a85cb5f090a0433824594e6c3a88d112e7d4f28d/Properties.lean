import LiveScripts.Shared
import LiveScripts.S_7a0ac34345294044a85cb5f090a0433824594e6c3a88d112e7d4f28d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7a0ac34345294044a85cb5f090a0433824594e6c3a88d112e7d4f28d.script [ctx] 10000]
