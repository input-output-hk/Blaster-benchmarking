import LiveScripts.Shared
import LiveScripts.S_e84253e6e64e057db68d5ede2836f091ca21cb89efae791779777297.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e84253e6e64e057db68d5ede2836f091ca21cb89efae791779777297.script [ctx] 10000]
