import LiveScripts.Shared
import LiveScripts.S_4f32eba3c761386ae963ea7bf8f0237216cd2a78b38b660ab2433fe5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4f32eba3c761386ae963ea7bf8f0237216cd2a78b38b660ab2433fe5.script [ctx] 10000]
