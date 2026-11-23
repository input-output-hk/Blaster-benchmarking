import LiveScripts.Shared
import LiveScripts.S_f456e4ed16dc203d7e2fe102a4092180d57f428fb233b192433fd862.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f456e4ed16dc203d7e2fe102a4092180d57f428fb233b192433fd862.script [ctx] 10000]
