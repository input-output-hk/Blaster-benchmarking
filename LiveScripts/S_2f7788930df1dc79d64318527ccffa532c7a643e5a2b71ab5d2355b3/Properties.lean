import LiveScripts.Shared
import LiveScripts.S_2f7788930df1dc79d64318527ccffa532c7a643e5a2b71ab5d2355b3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2f7788930df1dc79d64318527ccffa532c7a643e5a2b71ab5d2355b3.script [ctx] 10000]
