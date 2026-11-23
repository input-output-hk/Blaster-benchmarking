import LiveScripts.Shared
import LiveScripts.S_63536f449c3c0576fda2b1f70cb422328765d6771fc231d7ea16b6cd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_63536f449c3c0576fda2b1f70cb422328765d6771fc231d7ea16b6cd.script [ctx] 10000]
