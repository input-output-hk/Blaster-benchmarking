import LiveScripts.Shared
import LiveScripts.S_d953eb919e3b3e46651fee3381faefaf913eba11cb70c9ee432e1b69.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d953eb919e3b3e46651fee3381faefaf913eba11cb70c9ee432e1b69.script [datum, redeemer, ctx] 10000]
