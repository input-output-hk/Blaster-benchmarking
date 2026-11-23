import LiveScripts.Shared
import LiveScripts.S_ae054b34f6a3a159785f3bab2dae9b26e563b2118af2dfe216c19ee9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ae054b34f6a3a159785f3bab2dae9b26e563b2118af2dfe216c19ee9.script [datum, redeemer, ctx] 10000]
