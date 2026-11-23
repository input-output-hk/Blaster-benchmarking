import LiveScripts.Shared
import LiveScripts.S_6550a9e4cfd61d4996ec305da108a9e3d672e6ffacbcaa42ab51b451.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6550a9e4cfd61d4996ec305da108a9e3d672e6ffacbcaa42ab51b451.script [ctx] 10000]
