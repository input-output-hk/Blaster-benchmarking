import LiveScripts.Shared
import LiveScripts.S_1c08646e7129a675a85e206ba269528b1482b1ccad2110c0c04f0cb7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1c08646e7129a675a85e206ba269528b1482b1ccad2110c0c04f0cb7.script [ctx] 10000]
