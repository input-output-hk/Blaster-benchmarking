import LiveScripts.Shared
import LiveScripts.S_e5a22e4c31db20bce1c8b081f8e4009683990a33157947d75030deb8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e5a22e4c31db20bce1c8b081f8e4009683990a33157947d75030deb8.script [ctx] 10000]
