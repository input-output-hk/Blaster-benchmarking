import LiveScripts.Shared
import LiveScripts.S_814ae039589e06258d11f86b24e5aa1659d044a135a04d8df942aa37.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_814ae039589e06258d11f86b24e5aa1659d044a135a04d8df942aa37.script [ctx] 10000]
