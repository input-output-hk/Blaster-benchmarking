import LiveScripts.Shared
import LiveScripts.S_8ed8a1247660c8d22c1177ff997fb017ef5b2e29b23cc84016d1a0c0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8ed8a1247660c8d22c1177ff997fb017ef5b2e29b23cc84016d1a0c0.script [ctx] 10000]
