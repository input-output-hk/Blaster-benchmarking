import LiveScripts.Shared
import LiveScripts.S_b67e61dd26e648d0458d88998a417dfff39b37fdec9343d3a8d03898.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b67e61dd26e648d0458d88998a417dfff39b37fdec9343d3a8d03898.script [ctx] 10000]
