import LiveScripts.Shared
import LiveScripts.S_fb6df884fb94122937b05f8228c2cbeb633c1729c4e0604a21abb5c3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fb6df884fb94122937b05f8228c2cbeb633c1729c4e0604a21abb5c3.script [ctx] 10000]
