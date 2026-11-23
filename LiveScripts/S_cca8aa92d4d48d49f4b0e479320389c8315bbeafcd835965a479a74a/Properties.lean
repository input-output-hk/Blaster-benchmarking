import LiveScripts.Shared
import LiveScripts.S_cca8aa92d4d48d49f4b0e479320389c8315bbeafcd835965a479a74a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cca8aa92d4d48d49f4b0e479320389c8315bbeafcd835965a479a74a.script [ctx] 10000]
