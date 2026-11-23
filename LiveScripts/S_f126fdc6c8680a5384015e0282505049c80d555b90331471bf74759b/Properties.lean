import LiveScripts.Shared
import LiveScripts.S_f126fdc6c8680a5384015e0282505049c80d555b90331471bf74759b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f126fdc6c8680a5384015e0282505049c80d555b90331471bf74759b.script [ctx] 10000]
