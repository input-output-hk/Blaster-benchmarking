import LiveScripts.Shared
import LiveScripts.S_c9450bfc1cc5fe4b6bf5aa5a4c1bd347aa2ac38c455f8a2ebdb1e9dc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c9450bfc1cc5fe4b6bf5aa5a4c1bd347aa2ac38c455f8a2ebdb1e9dc.script [ctx] 10000]
