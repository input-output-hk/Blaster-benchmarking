import LiveScripts.Shared
import LiveScripts.S_f7dc34dd624bb59a9807c97d259e79c5ba81bfbf683bedd0cbb7c77c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f7dc34dd624bb59a9807c97d259e79c5ba81bfbf683bedd0cbb7c77c.script [ctx] 10000]
