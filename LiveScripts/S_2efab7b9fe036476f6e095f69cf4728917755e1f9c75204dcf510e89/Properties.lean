import LiveScripts.Shared
import LiveScripts.S_2efab7b9fe036476f6e095f69cf4728917755e1f9c75204dcf510e89.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2efab7b9fe036476f6e095f69cf4728917755e1f9c75204dcf510e89.script [ctx] 10000]
