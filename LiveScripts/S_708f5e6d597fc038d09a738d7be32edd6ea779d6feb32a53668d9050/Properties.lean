import LiveScripts.Shared
import LiveScripts.S_708f5e6d597fc038d09a738d7be32edd6ea779d6feb32a53668d9050.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_708f5e6d597fc038d09a738d7be32edd6ea779d6feb32a53668d9050.script [redeemer, ctx] 10000]
