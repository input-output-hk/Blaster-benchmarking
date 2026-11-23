import LiveScripts.Shared
import LiveScripts.S_6f1d45af96a24a0840443314af47289fa5cd100a93400bcd606b6c1b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6f1d45af96a24a0840443314af47289fa5cd100a93400bcd606b6c1b.script [ctx] 10000]
