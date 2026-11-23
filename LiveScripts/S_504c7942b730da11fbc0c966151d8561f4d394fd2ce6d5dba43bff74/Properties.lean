import LiveScripts.Shared
import LiveScripts.S_504c7942b730da11fbc0c966151d8561f4d394fd2ce6d5dba43bff74.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_504c7942b730da11fbc0c966151d8561f4d394fd2ce6d5dba43bff74.script [ctx] 10000]
