import LiveScripts.Shared
import LiveScripts.S_b0b99c50b9ec9c997086cb2222bb9e4fa2841d77b2e7580b94d6e0c6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b0b99c50b9ec9c997086cb2222bb9e4fa2841d77b2e7580b94d6e0c6.script [datum, redeemer, ctx] 10000]
