import LiveScripts.Shared
import LiveScripts.S_159f756241a939d6787c471f14202ed86ea924bf505480b8f07869f0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_159f756241a939d6787c471f14202ed86ea924bf505480b8f07869f0.script [ctx] 10000]
