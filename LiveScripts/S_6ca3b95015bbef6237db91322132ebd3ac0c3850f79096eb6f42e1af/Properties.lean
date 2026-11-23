import LiveScripts.Shared
import LiveScripts.S_6ca3b95015bbef6237db91322132ebd3ac0c3850f79096eb6f42e1af.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6ca3b95015bbef6237db91322132ebd3ac0c3850f79096eb6f42e1af.script [ctx] 10000]
