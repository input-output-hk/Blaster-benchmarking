import LiveScripts.Shared
import LiveScripts.S_c1bc7539bae1b0ce6c0786e0a6191c9372f4342d0b48f0a27dbbdec0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c1bc7539bae1b0ce6c0786e0a6191c9372f4342d0b48f0a27dbbdec0.script [ctx] 10000]
