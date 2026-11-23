import LiveScripts.Shared
import LiveScripts.S_2dbe4dd74f6c1f00d8182833e8e5114d2013ed0e9ab1db011aa56d70.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2dbe4dd74f6c1f00d8182833e8e5114d2013ed0e9ab1db011aa56d70.script [ctx] 10000]
