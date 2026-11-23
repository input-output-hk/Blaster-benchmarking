import LiveScripts.Shared
import LiveScripts.S_c09578e880308efdce284250babe1a26222628b46b939c4966f96909.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c09578e880308efdce284250babe1a26222628b46b939c4966f96909.script [ctx] 10000]
