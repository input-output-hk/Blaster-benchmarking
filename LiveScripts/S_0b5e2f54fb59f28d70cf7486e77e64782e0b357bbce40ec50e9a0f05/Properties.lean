import LiveScripts.Shared
import LiveScripts.S_0b5e2f54fb59f28d70cf7486e77e64782e0b357bbce40ec50e9a0f05.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0b5e2f54fb59f28d70cf7486e77e64782e0b357bbce40ec50e9a0f05.script [ctx] 10000]
