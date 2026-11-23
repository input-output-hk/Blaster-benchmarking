import LiveScripts.Shared
import LiveScripts.S_20256f557cec14f61cc662468f7812a1e6531e628af257a5fc5dd0c5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_20256f557cec14f61cc662468f7812a1e6531e628af257a5fc5dd0c5.script [ctx] 10000]
