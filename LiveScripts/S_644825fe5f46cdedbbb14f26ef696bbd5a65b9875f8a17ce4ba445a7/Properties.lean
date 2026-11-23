import LiveScripts.Shared
import LiveScripts.S_644825fe5f46cdedbbb14f26ef696bbd5a65b9875f8a17ce4ba445a7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_644825fe5f46cdedbbb14f26ef696bbd5a65b9875f8a17ce4ba445a7.script [ctx] 10000]
