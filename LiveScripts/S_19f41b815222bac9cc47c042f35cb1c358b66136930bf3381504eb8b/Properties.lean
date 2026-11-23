import LiveScripts.Shared
import LiveScripts.S_19f41b815222bac9cc47c042f35cb1c358b66136930bf3381504eb8b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_19f41b815222bac9cc47c042f35cb1c358b66136930bf3381504eb8b.script [ctx] 10000]
