import LiveScripts.Shared
import LiveScripts.S_990601c292662fc24dd6873ff4decc0a30bb49dbfb2be5749546e81d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_990601c292662fc24dd6873ff4decc0a30bb49dbfb2be5749546e81d.script [ctx] 10000]
