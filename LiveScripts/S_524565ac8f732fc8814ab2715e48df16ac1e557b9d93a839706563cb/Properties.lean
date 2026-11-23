import LiveScripts.Shared
import LiveScripts.S_524565ac8f732fc8814ab2715e48df16ac1e557b9d93a839706563cb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_524565ac8f732fc8814ab2715e48df16ac1e557b9d93a839706563cb.script [ctx] 10000]
