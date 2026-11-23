import LiveScripts.Shared
import LiveScripts.S_eb55e440da235c80974c7883b0920c06b31ddac66c12c238626266e9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_eb55e440da235c80974c7883b0920c06b31ddac66c12c238626266e9.script [ctx] 10000]
