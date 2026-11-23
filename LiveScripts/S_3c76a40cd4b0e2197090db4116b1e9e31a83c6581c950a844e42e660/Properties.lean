import LiveScripts.Shared
import LiveScripts.S_3c76a40cd4b0e2197090db4116b1e9e31a83c6581c950a844e42e660.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3c76a40cd4b0e2197090db4116b1e9e31a83c6581c950a844e42e660.script [ctx] 10000]
