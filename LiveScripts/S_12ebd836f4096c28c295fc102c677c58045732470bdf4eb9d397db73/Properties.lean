import LiveScripts.Shared
import LiveScripts.S_12ebd836f4096c28c295fc102c677c58045732470bdf4eb9d397db73.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_12ebd836f4096c28c295fc102c677c58045732470bdf4eb9d397db73.script [ctx] 10000]
