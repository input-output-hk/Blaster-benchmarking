import LiveScripts.Shared
import LiveScripts.S_6884406452e119c991c1a898853ab24072ba81e6a5726e9bf2e52db2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6884406452e119c991c1a898853ab24072ba81e6a5726e9bf2e52db2.script [ctx] 10000]
