import LiveScripts.Shared
import LiveScripts.S_f7d0d1e5bfa5542a421a3020bbbe4b48c82404c4c154294a4aa9443d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f7d0d1e5bfa5542a421a3020bbbe4b48c82404c4c154294a4aa9443d.script [datum, redeemer, ctx] 10000]
