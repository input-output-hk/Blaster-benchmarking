import LiveScripts.Shared
import LiveScripts.S_b6927417345ae7222a7238203beaed94b6d61accb6804bc7b87004f0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b6927417345ae7222a7238203beaed94b6d61accb6804bc7b87004f0.script [ctx] 10000]
