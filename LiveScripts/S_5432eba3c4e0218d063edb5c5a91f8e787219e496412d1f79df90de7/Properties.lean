import LiveScripts.Shared
import LiveScripts.S_5432eba3c4e0218d063edb5c5a91f8e787219e496412d1f79df90de7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5432eba3c4e0218d063edb5c5a91f8e787219e496412d1f79df90de7.script [ctx] 10000]
