import LiveScripts.Shared
import LiveScripts.S_484e733d122af44e6101988bcc47ed261a7af5c43c797e89d60e3075.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_484e733d122af44e6101988bcc47ed261a7af5c43c797e89d60e3075.script [ctx] 10000]
