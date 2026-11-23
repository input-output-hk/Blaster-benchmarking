import LiveScripts.Shared
import LiveScripts.S_0d9c11fec4d50a141e3c029ed984999d4fd09e2c7dc17159ae3f5ce2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0d9c11fec4d50a141e3c029ed984999d4fd09e2c7dc17159ae3f5ce2.script [redeemer, ctx] 10000]
