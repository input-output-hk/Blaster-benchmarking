import LiveScripts.Shared
import LiveScripts.S_cc66b969a00d90e7cfaaecf51f0e8dca2d1a84742d52f140ec4f1dcd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cc66b969a00d90e7cfaaecf51f0e8dca2d1a84742d52f140ec4f1dcd.script [ctx] 10000]
