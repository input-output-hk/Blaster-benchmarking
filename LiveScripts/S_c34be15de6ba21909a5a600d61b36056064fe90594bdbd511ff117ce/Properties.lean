import LiveScripts.Shared
import LiveScripts.S_c34be15de6ba21909a5a600d61b36056064fe90594bdbd511ff117ce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c34be15de6ba21909a5a600d61b36056064fe90594bdbd511ff117ce.script [ctx] 10000]
