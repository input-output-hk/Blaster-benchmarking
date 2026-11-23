import LiveScripts.Shared
import LiveScripts.S_788b66c2e123c40b046adc964df3acffe11deef41ac8aaf6c7f7bf33.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_788b66c2e123c40b046adc964df3acffe11deef41ac8aaf6c7f7bf33.script [ctx] 10000]
