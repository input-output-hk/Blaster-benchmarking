import LiveScripts.Shared
import LiveScripts.S_792b3f921d8a61b6fced92a0668ee9ac64be4b699ad4bbdd62916e77.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_792b3f921d8a61b6fced92a0668ee9ac64be4b699ad4bbdd62916e77.script [ctx] 10000]
