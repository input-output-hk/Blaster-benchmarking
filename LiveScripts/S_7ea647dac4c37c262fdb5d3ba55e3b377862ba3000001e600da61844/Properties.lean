import LiveScripts.Shared
import LiveScripts.S_7ea647dac4c37c262fdb5d3ba55e3b377862ba3000001e600da61844.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7ea647dac4c37c262fdb5d3ba55e3b377862ba3000001e600da61844.script [ctx] 10000]
