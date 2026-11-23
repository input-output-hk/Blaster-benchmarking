import LiveScripts.Shared
import LiveScripts.S_04eae2370d3db8373ebb5e4f843c8352178cf4f5cea84206b856f5d4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_04eae2370d3db8373ebb5e4f843c8352178cf4f5cea84206b856f5d4.script [ctx] 10000]
