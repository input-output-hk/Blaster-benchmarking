import LiveScripts.Shared
import LiveScripts.S_bb7062dec652641f77c251659c5475cd33679c638bfed3ef64fc7d2a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bb7062dec652641f77c251659c5475cd33679c638bfed3ef64fc7d2a.script [ctx] 10000]
