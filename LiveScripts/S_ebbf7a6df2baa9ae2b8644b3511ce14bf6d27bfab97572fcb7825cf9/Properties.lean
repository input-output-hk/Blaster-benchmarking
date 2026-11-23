import LiveScripts.Shared
import LiveScripts.S_ebbf7a6df2baa9ae2b8644b3511ce14bf6d27bfab97572fcb7825cf9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ebbf7a6df2baa9ae2b8644b3511ce14bf6d27bfab97572fcb7825cf9.script [ctx] 10000]
