import LiveScripts.Shared
import LiveScripts.S_daa59d07e4c35a2b32c36017534b3346e0576968d45d5b0e5cf41436.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_daa59d07e4c35a2b32c36017534b3346e0576968d45d5b0e5cf41436.script [ctx] 10000]
