import LiveScripts.Shared
import LiveScripts.S_444c0b96b06c53ff455435a110df0b7234a82b4d7ff83aa8f47d6082.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_444c0b96b06c53ff455435a110df0b7234a82b4d7ff83aa8f47d6082.script [ctx] 10000]
