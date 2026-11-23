import LiveScripts.Shared
import LiveScripts.S_e931493ab236bf8d8ba7cf4d6540e8e3577e241ea13e5e3a12f96a27.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e931493ab236bf8d8ba7cf4d6540e8e3577e241ea13e5e3a12f96a27.script [ctx] 10000]
