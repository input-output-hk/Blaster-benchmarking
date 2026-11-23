import LiveScripts.Shared
import LiveScripts.S_d16756ba0957d07e756087efbe38af7cd6ed6e38a6b74e4b9c0879e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d16756ba0957d07e756087efbe38af7cd6ed6e38a6b74e4b9c0879e8.script [redeemer, ctx] 10000]
