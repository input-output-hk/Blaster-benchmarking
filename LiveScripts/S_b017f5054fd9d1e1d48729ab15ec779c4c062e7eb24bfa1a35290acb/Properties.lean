import LiveScripts.Shared
import LiveScripts.S_b017f5054fd9d1e1d48729ab15ec779c4c062e7eb24bfa1a35290acb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b017f5054fd9d1e1d48729ab15ec779c4c062e7eb24bfa1a35290acb.script [ctx] 10000]
