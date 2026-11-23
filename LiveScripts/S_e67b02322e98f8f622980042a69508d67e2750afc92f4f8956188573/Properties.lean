import LiveScripts.Shared
import LiveScripts.S_e67b02322e98f8f622980042a69508d67e2750afc92f4f8956188573.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e67b02322e98f8f622980042a69508d67e2750afc92f4f8956188573.script [ctx] 10000]
