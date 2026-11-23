import LiveScripts.Shared
import LiveScripts.S_8838350d766c1a509ddd1e50d49c6b057603f38f8a796cfade18bc88.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8838350d766c1a509ddd1e50d49c6b057603f38f8a796cfade18bc88.script [ctx] 10000]
