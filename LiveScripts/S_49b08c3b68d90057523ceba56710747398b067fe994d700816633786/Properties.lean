import LiveScripts.Shared
import LiveScripts.S_49b08c3b68d90057523ceba56710747398b067fe994d700816633786.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_49b08c3b68d90057523ceba56710747398b067fe994d700816633786.script [ctx] 10000]
