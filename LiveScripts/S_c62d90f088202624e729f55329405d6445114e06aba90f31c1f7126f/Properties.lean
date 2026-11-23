import LiveScripts.Shared
import LiveScripts.S_c62d90f088202624e729f55329405d6445114e06aba90f31c1f7126f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c62d90f088202624e729f55329405d6445114e06aba90f31c1f7126f.script [datum, redeemer, ctx] 10000]
