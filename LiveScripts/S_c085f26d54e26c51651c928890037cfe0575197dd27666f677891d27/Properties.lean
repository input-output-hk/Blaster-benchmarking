import LiveScripts.Shared
import LiveScripts.S_c085f26d54e26c51651c928890037cfe0575197dd27666f677891d27.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c085f26d54e26c51651c928890037cfe0575197dd27666f677891d27.script [ctx] 10000]
