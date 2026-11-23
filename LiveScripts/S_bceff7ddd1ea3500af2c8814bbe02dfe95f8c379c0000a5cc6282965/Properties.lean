import LiveScripts.Shared
import LiveScripts.S_bceff7ddd1ea3500af2c8814bbe02dfe95f8c379c0000a5cc6282965.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bceff7ddd1ea3500af2c8814bbe02dfe95f8c379c0000a5cc6282965.script [ctx] 10000]
