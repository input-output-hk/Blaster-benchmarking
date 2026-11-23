import LiveScripts.Shared
import LiveScripts.S_01e3b676efa97dc2cc02593133701e959d6fdc54f8be87ee59bbc722.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_01e3b676efa97dc2cc02593133701e959d6fdc54f8be87ee59bbc722.script [redeemer, ctx] 10000]
