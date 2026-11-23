import LiveScripts.Shared
import LiveScripts.S_303cc9b1fb57b69530de8f0995e2f23f4c41018cd4168ab53e6bf118.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_303cc9b1fb57b69530de8f0995e2f23f4c41018cd4168ab53e6bf118.script [ctx] 10000]
