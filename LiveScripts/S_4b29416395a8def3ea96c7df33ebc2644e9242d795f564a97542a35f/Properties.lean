import LiveScripts.Shared
import LiveScripts.S_4b29416395a8def3ea96c7df33ebc2644e9242d795f564a97542a35f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4b29416395a8def3ea96c7df33ebc2644e9242d795f564a97542a35f.script [redeemer, ctx] 10000]
