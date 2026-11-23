import LiveScripts.Shared
import LiveScripts.S_6d45b804a8bdd6a744299a3769ce9bdbb88e160215e442704b9d473b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6d45b804a8bdd6a744299a3769ce9bdbb88e160215e442704b9d473b.script [datum, redeemer, ctx] 10000]
