import LiveScripts.Shared
import LiveScripts.S_fc383e1cc6e6c6658e8f03932b923b3020aff0a1f202540285e43cf6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fc383e1cc6e6c6658e8f03932b923b3020aff0a1f202540285e43cf6.script [ctx] 10000]
