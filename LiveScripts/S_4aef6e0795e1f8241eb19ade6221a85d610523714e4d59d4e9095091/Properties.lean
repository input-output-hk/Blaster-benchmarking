import LiveScripts.Shared
import LiveScripts.S_4aef6e0795e1f8241eb19ade6221a85d610523714e4d59d4e9095091.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4aef6e0795e1f8241eb19ade6221a85d610523714e4d59d4e9095091.script [redeemer, ctx] 10000]
