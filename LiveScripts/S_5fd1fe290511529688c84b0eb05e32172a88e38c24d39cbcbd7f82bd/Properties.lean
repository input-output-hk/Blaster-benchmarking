import LiveScripts.Shared
import LiveScripts.S_5fd1fe290511529688c84b0eb05e32172a88e38c24d39cbcbd7f82bd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5fd1fe290511529688c84b0eb05e32172a88e38c24d39cbcbd7f82bd.script [ctx] 10000]
