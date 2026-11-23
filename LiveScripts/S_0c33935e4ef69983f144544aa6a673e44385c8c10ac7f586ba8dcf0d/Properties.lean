import LiveScripts.Shared
import LiveScripts.S_0c33935e4ef69983f144544aa6a673e44385c8c10ac7f586ba8dcf0d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0c33935e4ef69983f144544aa6a673e44385c8c10ac7f586ba8dcf0d.script [redeemer, ctx] 10000]
