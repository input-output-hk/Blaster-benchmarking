import LiveScripts.Shared
import LiveScripts.S_fb7966d076c1da670722296a9a42b676da204d6d6b3a32a59a294cf1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fb7966d076c1da670722296a9a42b676da204d6d6b3a32a59a294cf1.script [ctx] 10000]
