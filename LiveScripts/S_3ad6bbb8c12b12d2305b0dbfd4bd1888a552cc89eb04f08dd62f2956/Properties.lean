import LiveScripts.Shared
import LiveScripts.S_3ad6bbb8c12b12d2305b0dbfd4bd1888a552cc89eb04f08dd62f2956.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3ad6bbb8c12b12d2305b0dbfd4bd1888a552cc89eb04f08dd62f2956.script [ctx] 10000]
