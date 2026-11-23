import LiveScripts.Shared
import LiveScripts.S_740b038760b5eff3405a0a6c8448dfb34f6b48fb2d8ef9f83e16a37a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_740b038760b5eff3405a0a6c8448dfb34f6b48fb2d8ef9f83e16a37a.script [ctx] 10000]
