import LiveScripts.Shared
import LiveScripts.S_7215a421b8d1e8cd7cc566a1f8fd979d8c08452eb636172e7ebb923e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7215a421b8d1e8cd7cc566a1f8fd979d8c08452eb636172e7ebb923e.script [ctx] 10000]
