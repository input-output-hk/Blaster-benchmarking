import LiveScripts.Shared
import LiveScripts.S_e57f046704184c3ae2d1af98dbed8201315ed1122bec5d6b2caa7282.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e57f046704184c3ae2d1af98dbed8201315ed1122bec5d6b2caa7282.script [ctx] 10000]
