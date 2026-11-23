import LiveScripts.Shared
import LiveScripts.S_e1bb61913c1b4c24d83cc75746905e9f4163969daac4c0fdc3dfb9a2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e1bb61913c1b4c24d83cc75746905e9f4163969daac4c0fdc3dfb9a2.script [ctx] 10000]
