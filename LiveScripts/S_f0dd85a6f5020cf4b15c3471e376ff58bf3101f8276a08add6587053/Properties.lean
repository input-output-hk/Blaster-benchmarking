import LiveScripts.Shared
import LiveScripts.S_f0dd85a6f5020cf4b15c3471e376ff58bf3101f8276a08add6587053.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f0dd85a6f5020cf4b15c3471e376ff58bf3101f8276a08add6587053.script [ctx] 10000]
