import LiveScripts.Shared
import LiveScripts.S_379c5cb699e40b184cbf202dcbbe4e0a79a399c63c798e283d14caf3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_379c5cb699e40b184cbf202dcbbe4e0a79a399c63c798e283d14caf3.script [ctx] 10000]
