import LiveScripts.Shared
import LiveScripts.S_edb117e867f1e4d6ad1649f279f60f19c44b94a767a90cb607f1841f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_edb117e867f1e4d6ad1649f279f60f19c44b94a767a90cb607f1841f.script [ctx] 10000]
