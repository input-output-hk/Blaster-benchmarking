import LiveScripts.Shared
import LiveScripts.S_8ff81161002d63b1ccd15f6edb2af4c56df3b642357bfdbffeeda34f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8ff81161002d63b1ccd15f6edb2af4c56df3b642357bfdbffeeda34f.script [redeemer, ctx] 10000]
