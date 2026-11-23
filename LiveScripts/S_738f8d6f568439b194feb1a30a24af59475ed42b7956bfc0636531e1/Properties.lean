import LiveScripts.Shared
import LiveScripts.S_738f8d6f568439b194feb1a30a24af59475ed42b7956bfc0636531e1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_738f8d6f568439b194feb1a30a24af59475ed42b7956bfc0636531e1.script [ctx] 10000]
