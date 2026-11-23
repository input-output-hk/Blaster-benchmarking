import LiveScripts.Shared
import LiveScripts.S_c7f36e1c94c2740a6270816a166254509185aa9deee716ef8dac2304.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c7f36e1c94c2740a6270816a166254509185aa9deee716ef8dac2304.script [ctx] 10000]
