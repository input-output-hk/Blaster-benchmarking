import LiveScripts.Shared
import LiveScripts.S_37099c9d74bb4f8da56e79ae9eaa8775fb53eab9fc386d816612d1f5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_37099c9d74bb4f8da56e79ae9eaa8775fb53eab9fc386d816612d1f5.script [ctx] 10000]
