import LiveScripts.Shared
import LiveScripts.S_fa39dedcd54df68cc28d1cd2e24dc2b61a5f6646fce6f97080f3e66d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fa39dedcd54df68cc28d1cd2e24dc2b61a5f6646fce6f97080f3e66d.script [ctx] 10000]
