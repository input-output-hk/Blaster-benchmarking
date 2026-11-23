import LiveScripts.Shared
import LiveScripts.S_c11c3484799f26af5f9b2692d1a6d93a69dd3b4c0a5e1b6fdf3a4cb2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c11c3484799f26af5f9b2692d1a6d93a69dd3b4c0a5e1b6fdf3a4cb2.script [redeemer, ctx] 10000]
