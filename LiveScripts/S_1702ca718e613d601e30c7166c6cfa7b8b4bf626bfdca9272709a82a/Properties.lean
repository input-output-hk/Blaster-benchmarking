import LiveScripts.Shared
import LiveScripts.S_1702ca718e613d601e30c7166c6cfa7b8b4bf626bfdca9272709a82a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1702ca718e613d601e30c7166c6cfa7b8b4bf626bfdca9272709a82a.script [ctx] 10000]
