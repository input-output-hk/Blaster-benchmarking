import LiveScripts.Shared
import LiveScripts.S_ae364bd4888823a4c8932845a19c5b3891480a9a2e6ba068afd35ee7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ae364bd4888823a4c8932845a19c5b3891480a9a2e6ba068afd35ee7.script [ctx] 10000]
