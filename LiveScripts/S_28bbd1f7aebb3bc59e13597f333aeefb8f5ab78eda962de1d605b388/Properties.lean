import LiveScripts.Shared
import LiveScripts.S_28bbd1f7aebb3bc59e13597f333aeefb8f5ab78eda962de1d605b388.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_28bbd1f7aebb3bc59e13597f333aeefb8f5ab78eda962de1d605b388.script [datum, redeemer, ctx] 10000]
