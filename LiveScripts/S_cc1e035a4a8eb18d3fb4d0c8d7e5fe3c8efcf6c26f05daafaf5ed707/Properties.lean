import LiveScripts.Shared
import LiveScripts.S_cc1e035a4a8eb18d3fb4d0c8d7e5fe3c8efcf6c26f05daafaf5ed707.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cc1e035a4a8eb18d3fb4d0c8d7e5fe3c8efcf6c26f05daafaf5ed707.script [ctx] 10000]
