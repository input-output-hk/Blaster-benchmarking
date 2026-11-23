import LiveScripts.Shared
import LiveScripts.S_6ed6c370b29fdfcf59d27465209608b9674a51de9db9f69a12121f1f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6ed6c370b29fdfcf59d27465209608b9674a51de9db9f69a12121f1f.script [datum, redeemer, ctx] 10000]
