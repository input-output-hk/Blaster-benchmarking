import LiveScripts.Shared
import LiveScripts.S_10e76381f44212238af141b7c5628e5784d2fd101a7f74cc8c8a8939.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_10e76381f44212238af141b7c5628e5784d2fd101a7f74cc8c8a8939.script [ctx] 10000]
