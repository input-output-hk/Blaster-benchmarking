import LiveScripts.Shared
import LiveScripts.S_2c5c6ca6f993e198bc9ac859ffb624dd291ec50b4d361544bd01e3ac.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2c5c6ca6f993e198bc9ac859ffb624dd291ec50b4d361544bd01e3ac.script [ctx] 10000]
