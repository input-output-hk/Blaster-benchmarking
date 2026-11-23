import LiveScripts.Shared
import LiveScripts.S_e5c7a80ad98d32710e7c544fdf5fb8ed5ca8a8087929b7c63c6a2627.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e5c7a80ad98d32710e7c544fdf5fb8ed5ca8a8087929b7c63c6a2627.script [ctx] 10000]
