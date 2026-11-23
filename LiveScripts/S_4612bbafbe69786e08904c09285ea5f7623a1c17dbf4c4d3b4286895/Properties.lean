import LiveScripts.Shared
import LiveScripts.S_4612bbafbe69786e08904c09285ea5f7623a1c17dbf4c4d3b4286895.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4612bbafbe69786e08904c09285ea5f7623a1c17dbf4c4d3b4286895.script [ctx] 10000]
