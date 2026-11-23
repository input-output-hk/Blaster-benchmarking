import LiveScripts.Shared
import LiveScripts.S_cb7cb3811c6ebd4389985f1ddbf9e4deb3d92821bdb404072cb50186.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cb7cb3811c6ebd4389985f1ddbf9e4deb3d92821bdb404072cb50186.script [redeemer, ctx] 10000]
