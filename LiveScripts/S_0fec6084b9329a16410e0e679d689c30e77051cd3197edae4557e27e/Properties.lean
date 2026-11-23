import LiveScripts.Shared
import LiveScripts.S_0fec6084b9329a16410e0e679d689c30e77051cd3197edae4557e27e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0fec6084b9329a16410e0e679d689c30e77051cd3197edae4557e27e.script [datum, redeemer, ctx] 10000]
