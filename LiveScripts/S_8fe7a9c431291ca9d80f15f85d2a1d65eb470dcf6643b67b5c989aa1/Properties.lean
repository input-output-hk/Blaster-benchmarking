import LiveScripts.Shared
import LiveScripts.S_8fe7a9c431291ca9d80f15f85d2a1d65eb470dcf6643b67b5c989aa1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8fe7a9c431291ca9d80f15f85d2a1d65eb470dcf6643b67b5c989aa1.script [ctx] 10000]
