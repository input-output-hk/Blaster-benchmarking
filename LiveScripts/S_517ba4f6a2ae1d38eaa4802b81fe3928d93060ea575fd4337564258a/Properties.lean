import LiveScripts.Shared
import LiveScripts.S_517ba4f6a2ae1d38eaa4802b81fe3928d93060ea575fd4337564258a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_517ba4f6a2ae1d38eaa4802b81fe3928d93060ea575fd4337564258a.script [ctx] 10000]
