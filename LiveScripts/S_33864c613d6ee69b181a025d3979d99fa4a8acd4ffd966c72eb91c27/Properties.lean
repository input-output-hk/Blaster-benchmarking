import LiveScripts.Shared
import LiveScripts.S_33864c613d6ee69b181a025d3979d99fa4a8acd4ffd966c72eb91c27.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_33864c613d6ee69b181a025d3979d99fa4a8acd4ffd966c72eb91c27.script [ctx] 10000]
