import LiveScripts.Shared
import LiveScripts.S_c1999f6576099cdb3325705156934d5d33923002d74b54c6fc2ed99d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c1999f6576099cdb3325705156934d5d33923002d74b54c6fc2ed99d.script [ctx] 10000]
