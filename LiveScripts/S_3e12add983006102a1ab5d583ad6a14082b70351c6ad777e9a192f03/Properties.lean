import LiveScripts.Shared
import LiveScripts.S_3e12add983006102a1ab5d583ad6a14082b70351c6ad777e9a192f03.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3e12add983006102a1ab5d583ad6a14082b70351c6ad777e9a192f03.script [ctx] 10000]
