import LiveScripts.Shared
import LiveScripts.S_69f9667e575693e4f7d05d7feef7c4009eea14b49803ba375396a947.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_69f9667e575693e4f7d05d7feef7c4009eea14b49803ba375396a947.script [ctx] 10000]
