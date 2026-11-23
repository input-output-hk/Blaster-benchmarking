import LiveScripts.Shared
import LiveScripts.S_8f4b2bc3cb00b382fb88fe63e18062c1966f9bc607b9a786d035ad17.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8f4b2bc3cb00b382fb88fe63e18062c1966f9bc607b9a786d035ad17.script [ctx] 10000]
