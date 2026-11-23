import LiveScripts.Shared
import LiveScripts.S_c2fffe57227585d1a3a7dbb90fde2ed49303d83c78db1f0ca929d9d5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c2fffe57227585d1a3a7dbb90fde2ed49303d83c78db1f0ca929d9d5.script [ctx] 10000]
