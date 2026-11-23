import LiveScripts.Shared
import LiveScripts.S_3bcd70a4e1128f4cd0979a75ca2ca20c2636212c1d0952d6c5fd4cdd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3bcd70a4e1128f4cd0979a75ca2ca20c2636212c1d0952d6c5fd4cdd.script [ctx] 10000]
