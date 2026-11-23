import LiveScripts.Shared
import LiveScripts.S_2732fcef88f1c97ece2aeecb7699297d52a0fe7cfdd68f9fae31cc34.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2732fcef88f1c97ece2aeecb7699297d52a0fe7cfdd68f9fae31cc34.script [ctx] 10000]
