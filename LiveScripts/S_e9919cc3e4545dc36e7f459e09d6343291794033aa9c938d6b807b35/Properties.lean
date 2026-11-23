import LiveScripts.Shared
import LiveScripts.S_e9919cc3e4545dc36e7f459e09d6343291794033aa9c938d6b807b35.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e9919cc3e4545dc36e7f459e09d6343291794033aa9c938d6b807b35.script [ctx] 10000]
