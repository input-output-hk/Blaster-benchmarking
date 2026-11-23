import LiveScripts.Shared
import LiveScripts.S_52c38406e99de5261aa76eb32d9e92e24d195185d464a6c99176a0e1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_52c38406e99de5261aa76eb32d9e92e24d195185d464a6c99176a0e1.script [ctx] 10000]
